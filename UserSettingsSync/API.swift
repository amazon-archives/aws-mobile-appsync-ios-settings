/*
Copyright 2018 Amazon.com, Inc. and its affiliates. All Rights Reserved.

Licensed under the Amazon Software License (the "License").
You may not use this file except in compliance with the License.
A copy of the License is located at

http://aws.amazon.com/asl/

or in the "license" file accompanying this file. This file is distributed
on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
express or implied. See the License for the specific language governing
permissions and limitations under the License.
*/

//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct SettingsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(theme: Optional<String?> = nil, displayName: Optional<String?> = nil) {
    graphQLMap = ["theme": theme, "displayName": displayName]
  }

  public var theme: Optional<String?> {
    get {
      return graphQLMap["theme"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "theme")
    }
  }

  public var displayName: Optional<String?> {
    get {
      return graphQLMap["displayName"] as! Optional<String?>
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "displayName")
    }
  }
}

public final class GetSettingsQuery: GraphQLQuery {
  public static let operationString =
    "query GetSettings {\n  getSettings {\n    __typename\n    theme\n    displayName\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getSettings", type: .object(GetSetting.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getSettings: GetSetting? = nil) {
      self.init(snapshot: ["__typename": "Query", "getSettings": getSettings.flatMap { $0.snapshot }])
    }

    public var getSettings: GetSetting? {
      get {
        return (snapshot["getSettings"] as? Snapshot).flatMap { GetSetting(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getSettings")
      }
    }

    public struct GetSetting: GraphQLSelectionSet {
      public static let possibleTypes = ["Settings"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("theme", type: .scalar(String.self)),
        GraphQLField("displayName", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(theme: String? = nil, displayName: String? = nil) {
        self.init(snapshot: ["__typename": "Settings", "theme": theme, "displayName": displayName])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var theme: String? {
        get {
          return snapshot["theme"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "theme")
        }
      }

      public var displayName: String? {
        get {
          return snapshot["displayName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "displayName")
        }
      }
    }
  }
}

public final class SetSettingsMutation: GraphQLMutation {
  public static let operationString =
    "mutation SetSettings($settingsInput: SettingsInput) {\n  storeSettings(settings: $settingsInput) {\n    __typename\n    theme\n    displayName\n  }\n}"

  public var settingsInput: SettingsInput?

  public init(settingsInput: SettingsInput? = nil) {
    self.settingsInput = settingsInput
  }

  public var variables: GraphQLMap? {
    return ["settingsInput": settingsInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("storeSettings", arguments: ["settings": GraphQLVariable("settingsInput")], type: .object(StoreSetting.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(storeSettings: StoreSetting? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "storeSettings": storeSettings.flatMap { $0.snapshot }])
    }

    public var storeSettings: StoreSetting? {
      get {
        return (snapshot["storeSettings"] as? Snapshot).flatMap { StoreSetting(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "storeSettings")
      }
    }

    public struct StoreSetting: GraphQLSelectionSet {
      public static let possibleTypes = ["Settings"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("theme", type: .scalar(String.self)),
        GraphQLField("displayName", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(theme: String? = nil, displayName: String? = nil) {
        self.init(snapshot: ["__typename": "Settings", "theme": theme, "displayName": displayName])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var theme: String? {
        get {
          return snapshot["theme"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "theme")
        }
      }

      public var displayName: String? {
        get {
          return snapshot["displayName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "displayName")
        }
      }
    }
  }
}
