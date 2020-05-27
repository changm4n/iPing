//
//  HomeView.swift
//  iPing
//
//  Created by changmin lee on 2020/05/23.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var index = 0
    @State var offset : CGFloat = UIScreen.main.bounds.width / 2 * 1
    var width = UIScreen.main.bounds.width
    
    
    @State var data: [[DataModel]]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                VStack {
                    HStack(alignment: .center) {
                        Text("Total 19").font(.getCustom(type: .GIL, size: 39, weight: .LIGHT)).foregroundColor(Color("blackGray"))
                        Spacer()
                    }.frame(height: 30)
                        .padding(.horizontal, 24)
                    
                    SegmentBar(index: self.$index, offset: self.$offset).padding(.top, 24)
                    
                    GeometryReader { geo in
                        HStack(spacing: 0){
                            CollectionView(data: self.data).frame(width: geo.frame(in : .global).width)
                            CollectionView(data: self.data).frame(width: geo.frame(in : .global).width)
                        }.offset(x: self.offset)
                        .highPriorityGesture(DragGesture()
                        
                        .onEnded({ (value) in
                        
                            if value.translation.width > 50{// minimum drag...
                                
                                print("right")
                                self.changeView(left: false)
                            }
                            if -value.translation.width > 50{
                                
                                print("left")
                                self.changeView(left: true)
                            }
                        }))
                    }
                }.navigationBarItems(leading: Text("iPING").font(.getCustom(type: .NOTO, size: 14, weight: .MEDIUM)).foregroundColor(Color("blackGray")).padding(.horizontal, 10))
            }
            
        }.navigationBarTitle("", displayMode: .inline)
    }
    
    func changeView(left : Bool){
             
             if left{
                if self.index != 1{
                     self.index += 1
                 }
             }
             else{
                 if self.index != 0{
                     self.index -= 1
                 }
             }
             
             if self.index == 0 {
                withAnimation {
                    self.offset = self.width / 2 * 1
                }
             }
             else{
                withAnimation {
                    self.offset = self.width / 2 * -1
                }
             }
             // change the width based on the size of the tabs...
         }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                HomeView(data: sample).environment(\.colorScheme, .dark)
            }
            
            HomeView(data: sample)
        }
        
    }
}


struct SegmentBar: View {
    @Binding var index: Int
    @Binding var offset : CGFloat
    
    var width = UIScreen.main.bounds.width
    
    var body: some View{
        HStack{
            
            Button(action: {
                self.index = 0
                
                withAnimation {
                    self.offset = self.width / 2 * 1
                }
                
            }) {
                VStack(spacing: 8){
                    HStack(spacing: 12){
                        Text("최근 받은 핑").font(.getCustom(type: .NOTO, size: 14, weight: .MEDIUM))
                            .foregroundColor(self.index == 0 ? Color("theme") : Color("Gray133"))
                    }
                    
                    Rectangle()
                        .fill(self.index == 0 ? Color("theme") : Color.clear)
                        .frame(height: 2)
                        
                }.padding(.horizontal, 24)
            }
            
            Button(action: {
                self.index = 1
                withAnimation {
                    self.offset = self.width / 2 * -1
                }
                
            }) {
                VStack(spacing: 8){
                    HStack(spacing: 12){
                        Text("최근 날린 핑").font(.getCustom(type: .NOTO, size: 14, weight: .MEDIUM))
                            .foregroundColor(self.index == 1 ? Color("theme") : Color("Gray133"))
                    }
                    
                    Rectangle()
                        .fill(self.index == 1 ? Color("theme") : Color.clear)
                        .frame(height: 2)
                }.padding(.horizontal, 24)
            }
        }
    }
}

