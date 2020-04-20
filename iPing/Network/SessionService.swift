//
//  SessionService.swift
//  iPing
//
//  Created by changmin lee on 2020/04/20.
//  Copyright © 2020 changman. All rights reserved.
//

import Foundation
import Apollo

final class SessionService {
    
    let kBaseURL = "https://iping-backend.herokuapp.com"
    // Configure the network transport to use the singleton as the delegate.
    private lazy var networkTransport = HTTPNetworkTransport(
        url: URL(string: kBaseURL)!,
        delegate: self
    )
    
    // Use the configured network transport in your Apollo client.
    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
    
    static func singin(email: String, password: String) {
    }
}

