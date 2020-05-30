//
//  PasscodeView.swift
//  iPing
//
//  Created by kakao on 2020/05/01.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI
import Combine

struct PasscodeView: View {
    @Binding var show: Bool
    @State var phoneNumber: String
    
    @ObservedObject var viewModel: PasscodeViewModel = PasscodeViewModel()
    @State var isRespond: Bool? = true
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    @GestureState private var dragOffset = CGSize.zero
    
    @State var code: String = ""
    
    
    var btnBack : some View { Button(action: {
        self.show.toggle()
    }) {
        Image("back") // set image here
            .foregroundColor(Color("blackGray"))
        }
    }
    
    @State var passcode: String = ""
    
    var disposeBag = Set<AnyCancellable>()
    
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            ZStack {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("인증번호를\n입력해주세요").font(.custom("NotoSansCJKjp-Medium", size: 24)).fixedSize()
                            Text("\(self.phoneNumber)에 전송함").font(.custom("NotoSansCJKjp-Medium", size: 14)).foregroundColor(Color("blackGray")).fixedSize()
                        }.frame(height: 100)
                        
                        Spacer()
                    }
                    
                    Spacer().frame(height: 90)
                    
                    VStack {
                        DefaultTextField(text: $code, isResponder: $isRespond, keyboard: UIKeyboardType.numberPad)
                            .frame(height: 25).padding(.vertical, 4)
                        Rectangle().frame(height: 2).foregroundColor(Color("theme"))
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: InputNameView(viewModel: SignUpViewModel(phoneNumber: self.phoneNumber)), isActive: self.$viewModel.isNew) {
                            Text("")
                        }.hidden()
                        
                        Button(action: {
                            self.viewModel.sendCheck(phone: self.phoneNumber, code: self.code)
                        }) {
                            Text("다음")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(width: 152, height: 44)
                        }
                        .background(Color("theme"))
                        .clipShape(Capsule())
                        .modifier(AdaptsToSoftwareKeyboard())
                        .animation(.linear(duration: 0.1))
                    }
                }
                .padding(.horizontal, 24)
            }.navigationBarTitle("", displayMode: .automatic)
                .alert(isPresented: $viewModel.isWrong) {
                    Alert(title: Text("오류"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("닫기")))
            }
        }.onReceive(viewModel.$type) { (output) in
            if output == .MEMBER {
                self.viewControllerHolder?.present(style: .fullScreen) {
                    ContentView()
                }
            }
        }
    }
}

enum SessionType {
    case NEW
    case NONE
    case MEMBER
}

class PasscodeViewModel: ObservableObject {
    @Published var type: SessionType = .NONE {
        didSet {
            if type == .NEW {
                isNew = true
            }
        }
    }
    @Published var isWrong: Bool = false
    @Published var isNew: Bool = false
    @Published var success: Bool = false
    @Published var errorMessage: String = ""
    
    var phone: String = ""
    private var disposables = Set<AnyCancellable>()
    
    func sendCheck(phone: String, code: String) {
        SessionService.verifyCode(phone: phone, code: code).sink(receiveCompletion: { (completion) in
            
        }) { (data) in
            guard data.completePhoneVerification.ok != false else {
                self.errorMessage = "인증번호가 틀렸습니다!"
                self.isWrong = true
                return
            }
            
            if let token = data.completePhoneVerification.token {
                print("OLD MEMBER")
                Session.me.saveToken(token: token)
                
                SessionService.getMe().sink(receiveCompletion: { (completion) in
                    switch completion {
                        case .failure(.gqlErrors(let error)):
                            self.errorMessage = error.first?.message ?? ""
                            self.isWrong = true
                        case .finished: ()
                        case .failure(.error): ()
                    }
                }) { (data) in
                    guard data.me.ok != false else {
                        self.isWrong = true
                        self.errorMessage = "회원정보를 불러오는 중 오류가 발생하였습니다."
                        return
                    }
                    
                    Session.me.setValues(user: data.me.user?.fragments.userFragment)
                    if Session.me.active {
                        Session.me.saveMyProfile()
                        self.type = .MEMBER
                    } else {
                        self.errorMessage = "회원정보를 불러오는 중 오류가 발생하였습니다."
                        self.isWrong = true
                        return
                    }
                }.store(in: &self.disposables)
            } else {
                print("NEW MEMBER")
                self.type = .NEW
            }
        }.store(in: &disposables)
    }
}

struct PasscodeView_Previews: PreviewProvider {
    @State var show: Bool = true
    static var previews: some View {
        PasscodeView(show: .constant(false), phoneNumber: "1234")
    }
}
