//
//  AlarmView.swift
//  iPing
//
//  Created by changmin lee on 2020/05/23.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI
import UIKit

struct Footer: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color("background"))
            .listRowInsets(EdgeInsets())
    }
}

struct AlarmView: View {
    let sample = [1,2,3,4,5,6]
    
    init() {
        // To remove only extra separators below the list:
//        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        ForEach(self.sample, id: \.self) { i in
                            AlarmCell().frame(height: 70).padding(.vertical, 4)
                        }
                    }.background(Color.white)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("defaultGray"), lineWidth: 0.5)
                    )
//                        .cornerRadius(20)
                    
                }.padding(.vertical)
                .navigationBarItems(leading:
                    Text("iPING")
                        .font(.getCustom(type: .NOTO, size: 14, weight: .MEDIUM))
                        .foregroundColor(Color("blackGray"))
                .padding(.horizontal, 10))
                .navigationBarTitle("알림", displayMode: .inline)
            }
            
        }
    }
}


struct AlarmCell: View {
    var body: some View {
        HStack(alignment: .center) {
            Image("창민")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("누구님이 핑을 날렸습니다.").font(.headline)
                Text("3시간 전").font(.caption)
            }.padding()
            Spacer()
            Image(systemName: "ellipsis")
        }.padding()
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
