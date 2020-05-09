//
//  ContentView.swift
//  iPing
//
//  Created by changmin lee on 2020/04/09.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI

extension Array {
    func chunked(by chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
}

class DataModel: Identifiable, ObservableObject {
    
    let id: String
    let name: String
    let imageName: String
    @Published var lastPing: Double
    
    init(name: String) {
        self.id = name
        self.name = name
        self.imageName = name
        lastPing = Date.timeIntervalSinceReferenceDate
    }
    
    func sendPing() {
        self.lastPing = Date.timeIntervalSinceReferenceDate
    }
}

let datas = ["구열","범키","영맨","희준","현수","한샘"]
let names = datas + datas

struct ContentView: View {
    var data: [[DataModel]] = names.map({ DataModel(name: $0) }).chunked(by: 3)
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        TabView {
            NavigationView {
                CollectionView(data: self.data).navigationBarTitle("iPing")
            }.tabItem {
                Text("핑")
            }
            
            Text("친구 리스트").tabItem {
                Text("친구")
            }
            Text("알림 리스트").tabItem {
                Text("알림")
            }
            Text("설정").tabItem {
                Text("설정")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
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
