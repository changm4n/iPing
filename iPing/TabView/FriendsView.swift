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
                VStack {
                    if store.error == nil {
                        List(store.contacts) { (contact: CNContact) in
                            return FriendsCell(name: contact.name).frame(height: 70)
                        }
                        .onAppear{
                            DispatchQueue.main.async {
                                self.store.fetch()
                            }
                        }
                    } else {
                        Text("error: \(store.error!.localizedDescription)")
                    }
                }
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
        }.padding(.horizontal, 4)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView().environmentObject(ContactStore())
    }
}
