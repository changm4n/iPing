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

extension Com where Base: ApolloClient {
    public func perform<Query: GraphQLMutation>(query: Query) -> Future<Query.Data, ApolloError> {
    
        return Future<Query.Data, ApolloError> { [weak base] promise in
            base?.perform(mutation: query) { result in
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



public struct Com<Base> {
    /// Base object to extend.
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has reactive extensions.
public protocol CombineCompatible {
    /// Extended type
    associatedtype CombineBase

    @available(*, deprecated, renamed: "CombineBase")
    typealias CompatibleType = CombineBase

    /// Reactive extensions.
    static var cb: Com<CombineBase>.Type { get set }

    /// Reactive extensions.
    var cb: Com<CombineBase> { get set }
}

extension CombineCompatible {
    /// Reactive extensions.
    public static var cb: Com<Self>.Type {
        get {
            return Com<Self>.self
        }
        // swiftlint:disable:next unused_setter_value
        set {
            // this enables using Reactive to "mutate" base type
        }
    }

    /// Reactive extensions.
    public var cb: Com<Self> {
        get {
            return Com(self)
        }
        // swiftlint:disable:next unused_setter_value
        set {
            // this enables using Reactive to "mutate" base object
        }
    }
}

import class Foundation.NSObject
extension NSObject: CombineCompatible { }
extension ApolloClient: CombineCompatible { }
