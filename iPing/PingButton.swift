//
//  PingButton.swift
//  iPing
//
//  Created by changmin lee on 2020/04/16.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI

struct PingButton: View {
    
    let kCircleSize: CGFloat = 84
    
    @ObservedObject var data: DataModel
    
    @GestureState var tap: Bool = false
    
    @State var tapped: Bool = false
    @State var press = false
    
    @State var smallCircleOpacity: Double = 1
    @State var bigCircleOpacity: Double = 1
    @State var bigCircleScale: CGFloat = 0.9
    
    var body: some View {
        VStack {
            Spacer(minLength: 30)
            ZStack {
                Circle().trim(from: tap ? 0.0001 : 1.1, to: 1)
                    .stroke(Color.yellow, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .scaleEffect(tap ? 1.2 : 0.98)
                    .opacity(smallCircleOpacity)
                
                
                Circle().trim(from: 0, to: 1)
                    .stroke(Color.yellow, style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
                    .scaleEffect(bigCircleScale)
                    .opacity(bigCircleOpacity)
                
                
                Image(self.data.imageName)
                    .resizable()
                    .frame(width: kCircleSize, height: kCircleSize)
                    .clipShape(Circle())
                    .scaleEffect(tap ? 1.2 : 1)
                    .gesture(LongPressGesture().updating($tap) { currentState, gestureState, transaction in
                        gestureState = currentState
                        print("on \(currentState) \(gestureState)")
                    }
                    .onChanged({ value in
                        self.smallCircleOpacity = 1
                        print("changed \(value)")
                    })
                        .onEnded({ value in
                            print("end \(value)")
                            self.smallCircleOpacity = 0
                            
                            self.bigCircleScale = 0.9
                            self.bigCircleOpacity = 1
                            withAnimation(.linear(duration: 0.8)) {
                                self.bigCircleScale = 1.8
                                self.bigCircleOpacity = 0
                            }
                        }))
            }.animation(.spring())
                .frame(width: kCircleSize, height: kCircleSize)
            
            
            Spacer()
            Text(self.data.name)
                .font(Font.system(size: 14))
        }
    }
}
struct NoButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

extension View {
    func delayTouches() -> some View {
        Button(action: {}) {
            highPriorityGesture(TapGesture())
        }
        .buttonStyle(NoButtonStyle())
    }
}
