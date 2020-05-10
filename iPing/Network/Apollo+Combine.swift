//
//  Apollo+Combine.swift
//  iPing
//
//  Created by kakao on 2020/05/11.
//  Copyright © 2020 changman. All rights reserved.
//

import Foundation
import Apollo
import Combine

extension ApolloClient {
    public func performCombine<Query: GraphQLMutation>(query: Query) -> Future<Query.Data, ApolloError> {
        
        return Future<Query.Data, ApolloError> { promise in
            self.perform(mutation: query) { result in
                switch result {
                case let .success(gqlResult):
                    if let errors = gqlResult.errors {
                        promise(.failure(ApolloError.gqlErrors(errors)))
                    } else if let data = gqlResult.data {
                        promise(.success(data))
                    }
                    
                case .failure(_):
                    promise(.failure(.error))
                }
            }
        }
    }
    
}
