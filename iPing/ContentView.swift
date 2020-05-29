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
let sample = names.map({ DataModel(name: $0) }).chunked(by: 3)

struct ContentView: View {
    var data: [[DataModel]] = sample
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        TabView {
            HomeView(data: self.data).tabItem {
                Text("핑")
            }
            
            FriendsView().environmentObject(ContactStore()).tabItem {
                
                Text("친구")
            }
            AlarmView().tabItem {
                AlarmView()
            }
            SettingView().tabItem {
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
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label.scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
