//
//  LoginView.swift
//  iPing
//
//  Created by changmin lee on 2020/04/19.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI

func configureStandard() {
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.configureWithOpaqueBackground()
    navBarAppearance.backgroundColor = UIColor(named: "background")
    navBarAppearance.shadowColor = .clear
    navBarAppearance.backgroundImage = UIImage()

    UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).standardAppearance = navBarAppearance
    UINavigationBar.appearance().tintColor = UIColor(named: "blackGray")
}

func configureLarge() {
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.configureWithOpaqueBackground()
    navBarAppearance.backgroundColor = UIColor(named: "background")
    navBarAppearance.shadowColor = .clear
    navBarAppearance.backgroundImage = UIImage()
    
    UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).scrollEdgeAppearance = navBarAppearance
    UINavigationBar.appearance().tintColor = UIColor(named: "blackGray")
}

struct LoginView: View {
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    
    @State var isActive: Bool = false
    init() {
//        configureLarge()
//        configureStandard()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                                LogoView()
//                                    .padding(.top, 100)
                                Spacer()
                                
                                NavigationLink(destination: NumberView(), isActive: self.$isActive) {
                                    Text("iPING 시작하기")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .frame(width: UIScreen.main.bounds.width - 48, height: 50)
                                }.background(Color("theme"))
                                    .clipShape(Capsule())
                                    .padding(.bottom, 8)
                                
                                Button(action: {
                                    ContactStore.shared.fetch()
                                    self.viewControllerHolder?.present(style: .fullScreen) {
                                        ContentView()
                                    }
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
                            .navigationBarTitle("", displayMode: .inline)
            }
            
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
