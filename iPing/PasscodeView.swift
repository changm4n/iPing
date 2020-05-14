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
                            Text("+821095156755에 전송함").font(.custom("NotoSansCJKjp-Medium", size: 14)).foregroundColor(Color("blackGray")).fixedSize()
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
                        
                        NavigationLink(destination: InputNameView(), isActive: self.$viewModel.isNew) {
                            Text("")
                        }.hidden()
                        
                        Button(action: {
                            if self.viewModel.type == .MEMBER {
                                self.viewControllerHolder?.present(style: .fullScreen) {
                                    ContentView()
                                }
                                
                            }
                            
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
    @Published var isNew: Bool = false
    @Published var success: Bool = false
    
    var phone: String = ""
    private var disposables = Set<AnyCancellable>()
    
    func sendCheck(phone: String, code: String) {
        SessionService.verifyCode(phone: phone, code: code).sink(receiveCompletion: { (completion) in
            
        }) { (data) in
            let token = data.completePhoneVerification.token
            if token == nil {
                print("NEW MEMBER")
                self.type = .NEW
            } else {
                print("OLD MEMBER")
                self.type = .MEMBER
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
