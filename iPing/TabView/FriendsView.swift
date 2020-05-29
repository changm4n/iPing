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
    
    @State var showSearch: Bool = false
    @State var showAdd: Bool = false
    
    @EnvironmentObject var store: ContactStore
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    @ObservedObject var viewModel = ContactViewModel()
    var body: some View {
        ZStack {
            if self.showSearch {
                SearchView(show: self.$showSearch)
            } else if self.showAdd {
                Text("add")
            } else {
                NavigationView {
                        List {
                            HStack {
                                Spacer()
                                Text("\(self.store.contacts.count) 명").font(.caption)
                            }.listRowBackground(Color("background"))
                                .frame(height: 10)
                            
                            
                            ForEach(store.contacts, id:\.self) { contact in
                                FriendsCell(name: contact.name).frame(height: 50).listRowBackground(Color("background"))
                            }
                        }.environment(\.defaultMinListRowHeight, 10)
                    
                    .navigationBarItems(leading: LogoItem(), trailing: NaviItem(showSearch: self.$showSearch, showAdd: self.$showAdd))
                    .navigationBarTitle("친구", displayMode: .large)
                }
            }
        }
    }
}

struct NaviItem: View {
    
    @Binding var showSearch: Bool
    @Binding var showAdd: Bool
    var body: some View {
        
        HStack(spacing: 4) {
            Button(action: {
                withAnimation {
                    self.showSearch = true
                }
            }) {
                Image(systemName: "magnifyingglass")
            }.padding()
            Spacer()
            Button(action: {
                withAnimation {
                    self.showAdd = true
                }
            }) {
                Image(systemName: "plus")
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
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(self.name).padding()
            Spacer()
            Image(systemName: "ellipsis")
        }
        .padding(.vertical)
        .padding(.horizontal, 4)
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView().environmentObject(ContactStore())
    }
}


struct SearchView: View {
    @ObservedObject var viewModel = ContactViewModel()
    @State private var searchText = ""
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("search", text: $viewModel.searchString)
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
                
                Button("취소") {
                    UIApplication.shared.endEditing(true)
                    self.searchText = ""
                    withAnimation {
                        self.show = false
                    }
                }
                .foregroundColor(Color(.systemBlue))
                
            }
            .padding(.horizontal)
            
            List {
                ForEach(self.viewModel.result, id:\.self) { contact in
                    FriendsCell(name: contact.name).frame(height: 50)
                }
            }.resignKeyboardOnDragGesture()
        }
    }
}
