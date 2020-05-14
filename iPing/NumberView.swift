//
//  NumberView.swift
//  iPing
//
//  Created by kakao on 2020/05/01.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI
import Combine

struct NumberView: View {
    
    @ObservedObject var viewModel: NumberViewModel = NumberViewModel()
    
    @State var isPresented: Bool = false
    @State var phoneNumber: String = ""
    @State var show: Bool = false
    @State var ID = ""
    @State var isRespond: Bool? = true
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    @GestureState private var dragOffset = CGSize.zero
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
                VStack {
                    HStack {
                        Text("전화번호를\n입력해주세요").font(.custom("NotoSansCJKjp-Medium", size: 24))
                        Spacer()
                    }
                    
                    Spacer().frame(height: 100)
                    
                    VStack {
                        DefaultTextField(text: $phoneNumber, isResponder: $isRespond, keyboard: UIKeyboardType.numberPad, placeholder: "전화번호").frame(height: 25).padding(.vertical, 4)
                        Rectangle().frame(height: 2).foregroundColor(Color("theme"))
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: PasscodeView(show: self.$viewModel.success, phoneNumber: self.phoneNumber), isActive: self.$viewModel.success) {
                            Button(action: {
                                print(self.phoneNumber)
//                                self.show.toggle()
                                
                                self.viewModel.verifyPhone(phone: self.phoneNumber)
                            }) {
                                Text("다음")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .frame(width: 152, height: 44)
                            }
                        }.background(Color("theme"))
                            .clipShape(Capsule())
                            .modifier(AdaptsToSoftwareKeyboard())
                            .animation(.default)
                    }
                }.padding(.horizontal, 24)
            }
        }
    }
    
}

struct NumberView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                NumberView().environment(\.colorScheme, .dark)
            }
            NumberView()
        }
    }
}


class NumberViewModel: ObservableObject {
    
    private var disposables = Set<AnyCancellable>()
    @Published var success: Bool = false
    
    func verifyPhone(phone: String) {
//        self.success = true
//        return
//        
        
        SessionService.verifyPhone(phone: phone).sink(receiveCompletion: { (completion) in
            switch completion {
            case .failure(_):
                print("erorr")
            case .finished: ()
                
            }
        }) { (data) in
            print(data.verifyPhone.ok)
            self.success = true
        }.store(in: &disposables)
    }
}
