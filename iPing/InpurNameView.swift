//
//  InpurNameView.swift
//  iPing
//
//  Created by changmin lee on 2020/05/13.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI
import Combine

struct InputNameView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    @State var isPresented: Bool = false
    @State var show: Bool = false
    @State var name = ""
    @State var isRespond: Bool? = true
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        Image("back") // set image here
            .foregroundColor(Color("blackGray"))
        }
    }
    
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            ZStack {
                if viewModel.success {
                    ContentView()
                } else {
                    VStack {
                        HStack {
                            Text("안녕하세요!\n이름을 입력해주세요.").font(.custom("NotoSansCJKjp-Medium", size: 24))
                            Spacer()
                        }
                        
                        Spacer().frame(height: 100)
                        
                        VStack {
                            DefaultTextField(text: $name, isResponder: $isRespond, keyboard: UIKeyboardType.default, placeholder: "").frame(height: 25).padding(.vertical, 4)
                            Rectangle().frame(height: 2).foregroundColor(Color("theme"))
                        }
                        Spacer()
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                self.viewModel.signUp(name: self.name)
                            }) {
                                Text("다음")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .frame(width: 152, height: 44)
                                    .background(Color("theme"))
                                    .clipShape(Capsule())
                                    .modifier(AdaptsToSoftwareKeyboard())
                                    .animation(.default)
                            }
                        }
                    }.padding(.horizontal, 24)
                }
            }.alert(isPresented: $viewModel.isWrong) {
                Alert(title: Text("오류"), message: Text("회원가입 중 오류가 발생하였습니다.\n\(viewModel.errorMessage ?? "")"), dismissButton: .default(Text("닫기")))
            }
        }
    }
    
}

class SignUpViewModel: ObservableObject {
    private var disposables = Set<AnyCancellable>()
    @Published var success: Bool = false
    @Published var isWrong: Bool = false
    var errorMessage: String? = nil
    var phoneNumber: String
    
    init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    func signUp(name: String) {
        SessionService.signUp(name: name, phone: self.phoneNumber).sink(receiveCompletion: { (completion) in
            switch completion {
            case .failure(.gqlErrors(let error)):
                self.errorMessage = error.first?.message
                self.isWrong = true
            case .finished: ()
            case .failure(.error): ()
            }
        }) { (data) in
            guard data.createAccount.ok != false, let token = data.createAccount.token else {
                self.isWrong = true
                return
            }
            Session.me.saveToken(token: token)
            
            SessionService.getMe().sink(receiveCompletion: { (completion) in
            }) { (data) in
                Session.me.setValues(user: data.me.user?.fragments.userFragment)
                self.success = Session.me.active
            }.store(in: &self.disposables)
        }.store(in: &disposables)
    }
}
