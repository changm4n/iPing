//
//  PingButton.swift
//  iPing
//
//  Created by changmin lee on 2020/04/16.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI

struct PingButton: View {
    
    @ObservedObject var data: DataModel
    
    @GestureState var tap = false
    @State var press = false
    
    var body: some View {
        VStack {
            Spacer(minLength: 30)
            ZStack {
                Image(self.data.imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .opacity(press ? 0 : 1)
                    .scaleEffect(press ? 0 : 1)
                
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .font(.system(size: 44, weight: .light))
                    .foregroundColor(.yellow)
                    .opacity(press ? 1: 0)
                    .scaleEffect(press ? 1 : 0)
            }
                
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay(
                Circle().trim(from: tap ? 0.001 : 1, to: 1)
                    .stroke(Color.yellow, style: StrokeStyle(lineWidth: 3, lineCap: .round))
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .animation(.easeInOut)
            )
                .scaleEffect(tap ? 1.2 : 1)
                .gesture(LongPressGesture().updating($tap) { currentState, gestureState, transaction in
                    gestureState = currentState
                    
                }
                .onEnded({ value in
                    self.press.toggle()
                    
                })).animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
            
            Spacer()
            Text(self.data.name)
                .font(Font.system(size: 14))
        }
    }
}
