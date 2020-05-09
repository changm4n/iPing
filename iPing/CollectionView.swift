//
//  CollectionView.swift
//  iPing
//
//  Created by changmin lee on 2020/04/16.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI

struct CollectionView: View {
    @State var data: [[DataModel]]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<self.data.count, id: \.self) { row in
                HStack {
                    ForEach(self.data[row]) { item in
                        Spacer()
//                        CollectionViewCell(data: item)
                        PingButton(data: item)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct CollectionViewCell: View {
    @ObservedObject var data: DataModel
    let timer = Timer.publish(every: 0.09, on: .main, in: .common).autoconnect()
    
    let kCoolTime: Double = 10
    
    @State private var leftTime: Double = 0
    @State private var selected = false
    
    var body: some View {
        Button(action: {
            print("\(self.data.name) pressed")
        }) {
            VStack {
                Spacer(minLength: 30)
                ZStack {
                    Circle()
                        .trim(from: 0, to: CGFloat(leftTime) / CGFloat(kCoolTime))
                        .stroke(lineWidth: 10.0)
                        .opacity(self.selected ? 0 : 1)
                        .foregroundColor(Color.yellow)
                        .rotationEffect(Angle(degrees: 270))
                    
                    
                    
                    Image(self.data.imageName)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.gray)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(
                            Circle()
                            .trim(from: 0, to: 1)
                            .stroke(lineWidth: 2.0)
                            .opacity(self.leftTime >= kCoolTime ? 1 : 0)
                            .foregroundColor(Color.yellow)
                            .scaleEffect(self.selected ? 1.8 : 1)
                        )
                    
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color.black)
                        .opacity(0.6 - (leftTime / kCoolTime))
                        .shadow(radius: 10)
                }
                
                Spacer()
                Text(self.data.name)
                    .font(Font.system(size: 14))
            }
        }.buttonStyle(BounceButtonStyle(handler: {

            withAnimation(.easeInOut(duration: 0.5)) {
                self.leftTime = self.kCoolTime
                self.data.sendPing()
                self.selected = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(Animation.easeInOut) {
                    self.selected = false
                }
            }
            
        })).onReceive(timer) { _ in
            let now = Date.timeIntervalSinceReferenceDate
            withAnimation(Animation.default) {
                self.leftTime = now - self.data.lastPing
            }
        }.onAppear {
            let now = Date.timeIntervalSinceReferenceDate
            self.leftTime = now - self.data.lastPing
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
