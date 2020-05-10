//
//  Network.swift
//  iPing
//
//  Created by changmin lee on 2020/04/20.
//  Copyright © 2020 changman. All rights reserved.
//

import Foundation
import Apollo

// MARK: - Singleton Wrapper

class Network {

    
    static let shared = Network()

    private(set) lazy var apollo = ApolloClient(url: URL(string: kBaseURL)!)

//    func perform<Query: GraphQLMutation>(query: Query) -> Maybe<Query.Data> {
//        Network.isNetworking(status: true)
//        return self.apollo.rx.perform(mutation: query, context: nil, queue: .main)
//            .do(onNext: { (_) in
//                Network.isNetworking(status: false)
//            }, onError: { _ in
//                Network.isNetworking(status: false)
//            })
//    }
}

// MARK: - Pre-flight delegate

extension Network: HTTPNetworkTransportPreflightDelegate {

    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          shouldSend request: URLRequest) -> Bool {
        // If there's an authenticated user, send the request. If not, don't.
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
