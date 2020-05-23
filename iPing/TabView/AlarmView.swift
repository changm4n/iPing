//
//  AlarmView.swift
//  iPing
//
//  Created by changmin lee on 2020/05/23.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI

struct AlarmView: View {
    let sample = [1,2,3,4,5,6]
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = UIColor(named: "blackGray")
        UINavigationBar.appearance().backgroundColor = .clear
        
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                ScrollView {
                    GeometryReader { geo in
                        VStack {
                            
                            ForEach(self.sample, id: \.self) { i in
                                Text("\(i)").frame(height: 50).frame(width: geo.frame(in : .global).width)
                            }
                            
                            
                        }.background(Color(.white))
                    }
                }
//                .background(Color("background"))
//                     .edgesIgnoringSafeArea(.all)
                .navigationBarItems(leading: Text("iPING").font(.getCustom(type: .NOTO, size: 14, weight: .MEDIUM)).foregroundColor(Color("blackGray")).padding(.horizontal, 10))
                .navigationBarTitle("알림", displayMode: .inline)
            }
            
        }
        
        
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
