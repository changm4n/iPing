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

    private(set) lazy var apollo = ApolloClient(url: URL(string: kBaseURL)!)

}

// MARK: - Pre-flight delegate

extension Network: HTTPNetworkTransportPreflightDelegate {

    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          shouldSend request: URLRequest) -> Bool {
        return true
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          willSend request: inout URLRequest) {

        // Get the existing headers, or create new ones if they're nil
//        var headers = request.allHTTPHeaderFields ?? [String: String]()
//        if let token = Session.fetchToken() {
//
//            #if DEBUG
//            headers["Authorization"] = token
//            #else
//            headers["Authorization"] = "Bearer " + token
//            #endif
//            headers["Platform"] = "IOS"
//        }
//
//        // Re-assign the updated headers to the request.
//        request.allHTTPHeaderFields = headers
    }
}
