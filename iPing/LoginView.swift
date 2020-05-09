//
//  LoginView.swift
//  iPing
//
//  Created by changmin lee on 2020/04/19.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var isActive: Bool = false
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = UIColor(named: "blackGray")
        UINavigationBar.appearance().backgroundColor = .clear
    }
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                LogoView().padding(.top, 100)
                Spacer()
                
//                NavigationLink(destination: NumberView()) {
//                    Text("iPING 시작하기")
//                                        .foregroundColor(.white)
//                                        .fontWeight(.bold)
//                                        .frame(width: UIScreen.main.bounds.width - 48, height: 50)
//                }.background(Color("theme"))
//                .clipShape(Capsule())
//                .padding(.bottom, 8)
                
                NavigationLink(destination: NumberView(), isActive: self.$isActive) {
                    Text("iPING 시작하기")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width - 48, height: 50)
                }.background(Color("theme"))
                    .clipShape(Capsule())
                    .padding(.bottom, 8)
                
                Button(action: {
                    
                }) {
                    Text("로그인")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width - 48, height: 50)
                }
                .background(Color.white)
                .clipShape(Capsule())
                
                Spacer().frame(height: 30)
                SignUpButton()
                Spacer().frame(height: 20)
            }
            .padding()
            .background(Color("background"))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("", displayMode: .large)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                LoginView().environment(\.colorScheme, .dark)
            }
            LoginView()
        }
    }
}

struct LogoView: View {
    var fontSize: CGFloat = 35
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("쉽고 빠르게").font(Font.system(size: 37, weight: .light))
                Text("주고받는").font(Font.system(size: 37, weight: .light))
                Text("iPING").font(Font.system(size: 39, weight: .semibold))
            }
        }
    }
}

struct SignUpButton: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("아직 회원이 아니신가요?").font(Font.system(size: 14))
                Text("회원가입 하기").foregroundColor(Color.orange)
                    .font(Font.system(size: 14))
            }
            Spacer()
        }
    }
}
