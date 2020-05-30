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
        return Network.shared.apollo.cb.perform(query: VerifyMutation(phone: phone))
    }
    
    static func verifyCode(phone: String, code: String) -> Future<CheckMutation.Data, ApolloError> {
        return Network.shared.apollo.cb.perform(query: CheckMutation(phone: phone, key: code))
    }
    
    static func signUp(name: String, phone: String, avatar: String? = nil) ->
        Future<SignupMutation.Data, ApolloError> {
            return Network.shared.apollo.cb.perform(query: SignupMutation(name: name, phone: phone, avatar: avatar))
    }
    
    static func getMe() -> Future<MeQuery.Data, ApolloError> {
        return Network.shared.apollo.cb.fetch(query: MeQuery())
    }
}
