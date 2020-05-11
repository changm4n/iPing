// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class VerifyMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation verify($phone: String!) {
      verifyPhone(phoneNumber: $phone) {
        __typename
        ok
      }
    }
    """

  public let operationName: String = "verify"

  public var phone: String

  public init(phone: String) {
    self.phone = phone
  }

  public var variables: GraphQLMap? {
    return ["phone": phone]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("verifyPhone", arguments: ["phoneNumber": GraphQLVariable("phone")], type: .nonNull(.object(VerifyPhone.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(verifyPhone: VerifyPhone) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "verifyPhone": verifyPhone.resultMap])
    }

    public var verifyPhone: VerifyPhone {
      get {
        return VerifyPhone(unsafeResultMap: resultMap["verifyPhone"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "verifyPhone")
      }
    }

    public struct VerifyPhone: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["verfiyPhoneResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool) {
        self.init(unsafeResultMap: ["__typename": "verfiyPhoneResponse", "ok": ok])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }
    }
  }
}

public final class CheckMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation check($phone: String!, $key: String!) {
      completePhoneVerification(phoneNumber: $phone, key: $key) {
        __typename
        ok
        message
        token
      }
    }
    """

  public let operationName: String = "check"

  public var phone: String
  public var key: String

  public init(phone: String, key: String) {
    self.phone = phone
    self.key = key
  }

  public var variables: GraphQLMap? {
    return ["phone": phone, "key": key]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("completePhoneVerification", arguments: ["phoneNumber": GraphQLVariable("phone"), "key": GraphQLVariable("key")], type: .nonNull(.object(CompletePhoneVerification.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(completePhoneVerification: CompletePhoneVerification) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "completePhoneVerification": completePhoneVerification.resultMap])
    }

    public var completePhoneVerification: CompletePhoneVerification {
      get {
        return CompletePhoneVerification(unsafeResultMap: resultMap["completePhoneVerification"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "completePhoneVerification")
      }
    }

    public struct CompletePhoneVerification: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["completePhoneVerificationResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("message", type: .scalar(String.self)),
        GraphQLField("token", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ok: Bool, message: String? = nil, token: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "completePhoneVerificationResponse", "ok": ok, "message": message, "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ok: Bool {
        get {
          return resultMap["ok"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "ok")
        }
      }

      public var message: String? {
        get {
          return resultMap["message"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "message")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }
    }
  }
}
