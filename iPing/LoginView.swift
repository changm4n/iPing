//
//  LoginView.swift
//  iPing
//
//  Created by changmin lee on 2020/04/19.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("IPING")
                Spacer()
            }.padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) + 15)
            Spacer()
            
            LogoView()
            Spacer()
            LoginForm()
            Spacer().frame(height: 30)
            SignUpButton()
            Spacer().frame(height: 20)
        }
        .padding()
        .edgesIgnoringSafeArea(.top)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                LoginView().environment(\.colorScheme, .dark)
                
            }
            //            LoginView().environment(\.colorScheme, .light)
        }
    }
}

struct LogoView: View {
    
    var fontSize: CGFloat = 45
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(alignment: .center, spacing: 0) {
                    Text("누군가의 ").font(Font.system(size: fontSize, weight: .thin))
                    Text("핑").font(Font.system(size: fontSize, weight: .bold))
                    Text("이").font(Font.system(size: fontSize, weight: .thin))
                }
                Text("설렘이 되는").font(Font.system(size: fontSize, weight: .thin))
                Text("경험").font(Font.system(size: fontSize, weight: .thin))
            }
        }
    }
}

struct LoginForm : View {
    
    @State var mail = ""
    @State var pass = ""
    
    var body: some View {
        VStack {
            VStack {
                HStack(spacing: 15) {
                    TextField("ID", text: self.$mail)
                }.padding(.vertical, 20)
                
                Divider()
                
                HStack(spacing: 15) {
                    SecureField("Password", text: self.$pass)
                    
                }.padding(.vertical, 20)
                
                Divider()
                Button(action: {
                    
                }) {
                    Text("로그인 하기")
                        .foregroundColor(.orange)
                        .fontWeight(.bold)
                        .padding(.vertical)
                }
                
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(30)
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
