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
    
    //    @ObservedObject var viewModel: NumberViewModel = NumberViewModel()
    
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
                VStack {
                    HStack {
                        Text("안녕하세요!\n이름을 입력해주세요.").font(.custom("NotoSansCJKjp-Medium", size: 24))
                        Spacer()
                    }
                    
                    Spacer().frame(height: 100)
                    
                    VStack {
                        DefaultTextField(text: $name, isResponder: $isRespond, keyboard: UIKeyboardType.numberPad, placeholder: "").frame(height: 25).padding(.vertical, 4)
                        Rectangle().frame(height: 2).foregroundColor(Color("theme"))
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.viewControllerHolder?.present(style: .fullScreen) {
                                ContentView()
                            }
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
        }
    }
    
}

struct InputNameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                InputNameView().environment(\.colorScheme, .dark)
            }
            InputNameView()
        }
    }
}
