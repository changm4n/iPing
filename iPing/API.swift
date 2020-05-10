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
