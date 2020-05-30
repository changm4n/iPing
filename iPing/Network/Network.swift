//
//  Network.swift
//  iPing
//
//  Created by changmin lee on 2020/04/20.
//  Copyright © 2020 changman. All rights reserved.
//

import Foundation
import Apollo

class Network {
    
    static let shared = Network()

//    private(set) lazy var apollo = ApolloClient(url: URL(string: kBaseURL)!)
    private lazy var networkTransport: HTTPNetworkTransport = {
        let transport = HTTPNetworkTransport(url: URL(string: kBaseURL)!)
        transport.delegate = self
        return transport
    }()
    // Use the configured network transport in your Apollo client.
    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)

}

// MARK: - Pre-flight delegate

extension Network: HTTPNetworkTransportPreflightDelegate {

    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          shouldSend request: URLRequest) -> Bool {
        return true
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
        var headers = request.allHTTPHeaderFields ?? [String: String]()
        if let token = Session.fetchToken() {
            headers["Authorization"] = "Bearer " + token
        }
        print(headers["Authorization"] ?? "")
        
        // Re-assign the updated headers to the request.
        request.allHTTPHeaderFields = headers
    }
}
