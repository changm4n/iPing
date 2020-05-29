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
                        PingButton(data: item)
                        Spacer()
                    }
                }
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
