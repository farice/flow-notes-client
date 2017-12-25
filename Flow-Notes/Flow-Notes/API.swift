//  This file was automatically generated and should not be edited.

import Apollo

public final class HelloWorldQuery: GraphQLQuery {
  public static let operationString =
    "query HelloWorld($rolls: Int!) {\n  getDie(numSides: 6) {\n    __typename\n    roll(numRolls: $rolls)\n  }\n}"

  public var rolls: Int

  public init(rolls: Int) {
    self.rolls = rolls
  }

  public var variables: GraphQLMap? {
    return ["rolls": rolls]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getDie", arguments: ["numSides": 6], type: .object(GetDie.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getDie: GetDie? = nil) {
      self.init(snapshot: ["__typename": "Query", "getDie": getDie.flatMap { $0.snapshot }])
    }

    public var getDie: GetDie? {
      get {
        return (snapshot["getDie"] as? Snapshot).flatMap { GetDie(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getDie")
      }
    }

    public struct GetDie: GraphQLSelectionSet {
      public static let possibleTypes = ["RandomDie"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("roll", arguments: ["numRolls": GraphQLVariable("rolls")], type: .list(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(roll: [Int?]? = nil) {
        self.init(snapshot: ["__typename": "RandomDie", "roll": roll])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var roll: [Int?]? {
        get {
          return snapshot["roll"] as? [Int?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "roll")
        }
      }
    }
  }
}