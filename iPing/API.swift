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

public final class SignupMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation signup($name: String!, $phone: String!, $avatar: String) {
      createAccount(phoneNumber: $phone, name: $name, avatar: $avatar) {
        __typename
        ok
        message
        token
      }
    }
    """

  public let operationName: String = "signup"

  public var name: String
  public var phone: String
  public var avatar: String?

  public init(name: String, phone: String, avatar: String? = nil) {
    self.name = name
    self.phone = phone
    self.avatar = avatar
  }

  public var variables: GraphQLMap? {
    return ["name": name, "phone": phone, "avatar": avatar]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createAccount", arguments: ["phoneNumber": GraphQLVariable("phone"), "name": GraphQLVariable("name"), "avatar": GraphQLVariable("avatar")], type: .nonNull(.object(CreateAccount.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createAccount: CreateAccount) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createAccount": createAccount.resultMap])
    }

    public var createAccount: CreateAccount {
      get {
        return CreateAccount(unsafeResultMap: resultMap["createAccount"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createAccount")
      }
    }

    public struct CreateAccount: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["createAccountResponse"]

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
        self.init(unsafeResultMap: ["__typename": "createAccountResponse", "ok": ok, "message": message, "token": token])
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

public final class MeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Me {
      me {
        __typename
        user {
          __typename
          ...UserFragment
        }
        ok
        message
      }
    }
    """

  public let operationName: String = "Me"

  public var queryDocument: String { return operationDefinition.appending(UserFragment.fragmentDefinition).appending(SmallPing.fragmentDefinition).appending(Friend.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("me", type: .nonNull(.object(Me.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.resultMap])
    }

    public var me: Me {
      get {
        return Me(unsafeResultMap: resultMap["me"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["meResponse"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("ok", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("message", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(user: User? = nil, ok: Bool, message: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "meResponse", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "ok": ok, "message": message])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
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

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(UserFragment.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var userFragment: UserFragment {
            get {
              return UserFragment(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public struct Friend: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment Friend on User {
      __typename
      id
      name
      avatar
    }
    """

  public static let possibleTypes: [String] = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("avatar", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, avatar: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "avatar": avatar])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var avatar: String? {
    get {
      return resultMap["avatar"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "avatar")
    }
  }
}

public struct SmallPing: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment SmallPing on Ping {
      __typename
      id
      to {
        __typename
        ...Friend
      }
      from {
        __typename
        ...Friend
      }
      text
      confirm
      createdAt
    }
    """

  public static let possibleTypes: [String] = ["Ping"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("to", type: .nonNull(.object(To.selections))),
    GraphQLField("from", type: .nonNull(.object(From.selections))),
    GraphQLField("text", type: .scalar(String.self)),
    GraphQLField("confirm", type: .nonNull(.scalar(Bool.self))),
    GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, to: To, from: From, text: String? = nil, confirm: Bool, createdAt: String) {
    self.init(unsafeResultMap: ["__typename": "Ping", "id": id, "to": to.resultMap, "from": from.resultMap, "text": text, "confirm": confirm, "createdAt": createdAt])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var to: To {
    get {
      return To(unsafeResultMap: resultMap["to"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "to")
    }
  }

  public var from: From {
    get {
      return From(unsafeResultMap: resultMap["from"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "from")
    }
  }

  public var text: String? {
    get {
      return resultMap["text"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "text")
    }
  }

  public var confirm: Bool {
    get {
      return resultMap["confirm"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "confirm")
    }
  }

  public var createdAt: String {
    get {
      return resultMap["createdAt"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public struct To: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(Friend.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String, avatar: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "avatar": avatar])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var friend: Friend {
        get {
          return Friend(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct From: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(Friend.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, name: String, avatar: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "avatar": avatar])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var friend: Friend {
        get {
          return Friend(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct UserFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment UserFragment on User {
      __typename
      id
      phoneNumber
      name
      avatar
      deviceToken
      unReadCount
      friends {
        __typename
        id
      }
      sendPings {
        __typename
        ...SmallPing
      }
      recvPings {
        __typename
        ...SmallPing
      }
    }
    """

  public static let possibleTypes: [String] = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("phoneNumber", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("avatar", type: .scalar(String.self)),
    GraphQLField("deviceToken", type: .scalar(String.self)),
    GraphQLField("unReadCount", type: .scalar(Int.self)),
    GraphQLField("friends", type: .list(.object(Friend.selections))),
    GraphQLField("sendPings", type: .list(.object(SendPing.selections))),
    GraphQLField("recvPings", type: .list(.object(RecvPing.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, phoneNumber: String, name: String, avatar: String? = nil, deviceToken: String? = nil, unReadCount: Int? = nil, friends: [Friend?]? = nil, sendPings: [SendPing?]? = nil, recvPings: [RecvPing?]? = nil) {
    self.init(unsafeResultMap: ["__typename": "User", "id": id, "phoneNumber": phoneNumber, "name": name, "avatar": avatar, "deviceToken": deviceToken, "unReadCount": unReadCount, "friends": friends.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }, "sendPings": sendPings.flatMap { (value: [SendPing?]) -> [ResultMap?] in value.map { (value: SendPing?) -> ResultMap? in value.flatMap { (value: SendPing) -> ResultMap in value.resultMap } } }, "recvPings": recvPings.flatMap { (value: [RecvPing?]) -> [ResultMap?] in value.map { (value: RecvPing?) -> ResultMap? in value.flatMap { (value: RecvPing) -> ResultMap in value.resultMap } } }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var phoneNumber: String {
    get {
      return resultMap["phoneNumber"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "phoneNumber")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var avatar: String? {
    get {
      return resultMap["avatar"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "avatar")
    }
  }

  public var deviceToken: String? {
    get {
      return resultMap["deviceToken"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "deviceToken")
    }
  }

  public var unReadCount: Int? {
    get {
      return resultMap["unReadCount"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "unReadCount")
    }
  }

  public var friends: [Friend?]? {
    get {
      return (resultMap["friends"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Friend?] in value.map { (value: ResultMap?) -> Friend? in value.flatMap { (value: ResultMap) -> Friend in Friend(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Friend?]) -> [ResultMap?] in value.map { (value: Friend?) -> ResultMap? in value.flatMap { (value: Friend) -> ResultMap in value.resultMap } } }, forKey: "friends")
    }
  }

  public var sendPings: [SendPing?]? {
    get {
      return (resultMap["sendPings"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SendPing?] in value.map { (value: ResultMap?) -> SendPing? in value.flatMap { (value: ResultMap) -> SendPing in SendPing(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [SendPing?]) -> [ResultMap?] in value.map { (value: SendPing?) -> ResultMap? in value.flatMap { (value: SendPing) -> ResultMap in value.resultMap } } }, forKey: "sendPings")
    }
  }

  public var recvPings: [RecvPing?]? {
    get {
      return (resultMap["recvPings"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [RecvPing?] in value.map { (value: ResultMap?) -> RecvPing? in value.flatMap { (value: ResultMap) -> RecvPing in RecvPing(unsafeResultMap: value) } } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [RecvPing?]) -> [ResultMap?] in value.map { (value: RecvPing?) -> ResultMap? in value.flatMap { (value: RecvPing) -> ResultMap in value.resultMap } } }, forKey: "recvPings")
    }
  }

  public struct Friend: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }
  }

  public struct SendPing: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Ping"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(SmallPing.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var smallPing: SmallPing {
        get {
          return SmallPing(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct RecvPing: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Ping"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(SmallPing.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var smallPing: SmallPing {
        get {
          return SmallPing(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}
