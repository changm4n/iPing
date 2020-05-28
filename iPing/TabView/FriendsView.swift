//
//  FriendsView.swift
//  iPing
//
//  Created by kakao on 2020/05/27.
//  Copyright © 2020 changman. All rights reserved.
//

import SwiftUI
import Contacts

struct FriendsView: View {
    @EnvironmentObject var store: ContactStore
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("background").edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("친구 \(ContactStore.shared.contacts.count)명")
                            .font(Font.getCustom(type: .NOTO, size: 24, weight: .MEDIUM))
                            .frame(alignment: .leading)
                        Spacer()
                    }.padding(.horizontal)
                    
                    FriendsTableView()
                }
            }.navigationBarItems(leading:
                Text("iPING")
                    .font(.getCustom(type: .NOTO, size: 14, weight: .MEDIUM))
                    .foregroundColor(Color("blackGray"))
                    .padding(.horizontal, 10))
                .navigationBarTitle("친구", displayMode: .inline)
            
        }
    }
}

struct FriendsTableView: View {
    var body: some View {
        ScrollView {
            VStack {
                if ContactStore.shared.error == nil {
                    
                    ForEach(ContactStore.shared.contacts) { contact in
                        FriendsCell(name: contact.name).frame(height: 70)
                    }
                } else {
                    Text("error: \( ContactStore.shared.error!.localizedDescription)")
                }
            }.background(Color.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("defaultGray"), lineWidth: 0.5)
            )
        }.padding(.vertical)
    }
}

struct FriendsCell: View {
    @State var name: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image("창민")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            Text(self.name).padding()
            Spacer()
            Image(systemName: "ellipsis")
        }.padding()
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView().environmentObject(ContactStore())
    }
}
