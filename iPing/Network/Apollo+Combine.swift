//
//  Apollo+Combine.swift
//  iPing
//
//  Created by changmin lee on 2020/05/11.
//  Copyright © 2020 changman. All rights reserved.
//

import Foundation
import Apollo
import Combine

extension Combinable where Base: ApolloClient {
    
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



public struct Combinable<Base> {
    
    public let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
}

/// A type that has reactive extensions.
public protocol CombineCompatible {
    
    associatedtype CombineBase

    @available(*, deprecated, renamed: "CombineBase")
    typealias CompatibleType = CombineBase

    
    static var cb: Combinable<CombineBase>.Type { get set }

    
    var cb: Combinable<CombineBase> { get set }
}

extension CombineCompatible {
    
    public static var cb: Combinable<Self>.Type {
        get {
            return Combinable<Self>.self
        }
        
        set {
            
        }
    }

    public var cb: Combinable<Self> {
        get {
            return Combinable(self)
        }
        
        set {
        
        }
    }
}

import class Foundation.NSObject
extension NSObject: CombineCompatible { }
extension ApolloClient: CombineCompatible { }
