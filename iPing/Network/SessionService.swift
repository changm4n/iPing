//
//  SessionService.swift
//  iPing
//
//  Created by changmin lee on 2020/04/20.
//  Copyright © 2020 changman. All rights reserved.
//

import Foundation
import Apollo
import Combine

public enum ApolloError: Error {
    case gqlErrors([GraphQLError])
    case error
}

final class SessionService {
    
    static func verifyPhone(phone: String) -> Future<VerifyMutation.Data, ApolloError> {
        return Network.shared.apollo.performCombine(query: VerifyMutation(phone: phone))
    }
}
