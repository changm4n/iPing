//
//  ContentView.swift
//  iPing
//
//  Created by changmin lee on 2020/04/09.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI
import QGrid

extension Array {
    func chunked(by chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}

struct DataModel: Identifiable {
    let id: String
    let name: String
    let imageName: String
    
    init(name: String) {
        self.id = name
        self.name = name
        self.imageName = name
    }
}

let datas = ["창민","구열","범키","영맨","희준","현수","한샘"]
let names = datas + datas

struct ContentView: View {
    let data: [[DataModel]] = names.map({ DataModel(name: $0) }).chunked(by: 3)
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            CollectionView(data: self.data).navigationBarTitle("iPing")
        }
    }
}

struct CollectionView: View {
    let data: [[DataModel]]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(0..<self.data.count, id: \.self) { row in
                HStack {
                    ForEach(self.data[row]) { item in
                        Spacer()
                        CollectionViewCell(data: item)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct CollectionViewCell: View {
    let data: DataModel
    
    @State private var selected = false
    @State private var show = true
    var body: some View {
        Button(action: {
            print("\(self.data.name) pressed")
        }) {
            VStack {
                Spacer(minLength: 30)
                ZStack {
                    Circle()
                        .trim(from: self.selected ? 0 : 1, to: 1)
                        .stroke(lineWidth: 6.0)
                        .opacity((self.selected && show) ? 1 : 0)
                        .foregroundColor(Color.yellow)
                        .rotationEffect(Angle(degrees: 270))
                    
                    Image(self.data.imageName)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(.yellow)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                
                Spacer()
                Text(self.data.name)
                    .font(Font.system(size: 14))
            }
        }.buttonStyle(BounceButtonStyle(handler: {
            self.show = true
            self.selected = false
            withAnimation(Animation.easeInOut(duration: 0.8)) {
                self.selected = true
            }
            withAnimation(Animation.easeInOut(duration: 1).delay(0.8)) {
                self.show = false
            }
        }))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .light)
    }
}

struct BounceButtonStyle: ButtonStyle {
 
    let handler: () -> ()
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label.onTapGesture(count: 2, perform: {
            self.handler()
        }).scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
