//
//  CharacterDatasets.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW.Character {
    
    public struct Achievements: Model {
        
        // MARK: - Properties
        
        public let achievementsCompleted: [Int]
        public let achievementsCompletedTimestamp: [Int]
        public let criteria: [Int]
        public let criteriaQuantity: [Int]
        public let criteriaTimestamp: [Int]
        public let criteriaCreated: [Int]
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.achievementsCompleted = json["achievementsCompleted"].map { $1.intValue }
            self.achievementsCompletedTimestamp = json["achievementsCompletedTimestamp"].map { $1.intValue }
            self.criteria = json["criteria"].map { $1.intValue }
            self.criteriaQuantity = json["criteriaQuantity"].map { $1.intValue }
            self.criteriaTimestamp = json["criteriaTimestamp"].map { $1.intValue }
            self.criteriaCreated = json["criteriaCreated"].map { $1.intValue }
        }
        
    }
    
    public struct Appearance: Model {
        
        // MARK: - Properties
        
        public let faceVariation: Int
        public let skinColor: Int
        public let hairVariation: Int
        public let hairColor: Int
        public let featureVariation: Int
        public let showHelm: Bool
        public let showCloak: Bool
        public let customDisplayOptions: [Int]
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.faceVariation = json["faceVariation"].intValue
            self.skinColor = json["skinColor"].intValue
            self.hairVariation = json["hairVariation"].intValue
            self.hairColor = json["hairColor"].intValue
            self.featureVariation = json["featureVariation"].intValue
            self.showHelm = json["showHelm"].boolValue
            self.showCloak = json["showCloak"].boolValue
            self.customDisplayOptions = json["customDisplayOptions"].map { $1.intValue }
        }
        
    }
    
    public struct Guild: Model {
        
        public struct Emblem {
            public let icon: Int
            public let iconColor: String
            public let iconColorId: Int
            public let border: Int
            public let borderColor: String
            public let borderColorId: Int
            public let backgroundColor: String
            public let backgroundColorId: Int
        }
        
        // MARK: - Properties
        
        public let name: String
        public let realm: String
        public let battlegroup: String
        public let members: Int
        public let achievementPoints: Int
        public let emblem: WoW.Character.Guild.Emblem
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.name = json["name"].stringValue
            self.realm = json["realm"].stringValue
            self.battlegroup = json["battlegroup"].stringValue
            self.members = json["members"].intValue
            self.achievementPoints = json["achievementPoints"].intValue
            
            let emblemJson = json["emblem"]
            self.emblem = WoW.Character.Guild.Emblem(
                icon: emblemJson["icon"].intValue,
                iconColor: emblemJson["iconColor"].stringValue,
                iconColorId: emblemJson["iconColorId"].intValue,
                border: emblemJson["border"].intValue,
                borderColor: emblemJson["borderColor"].stringValue,
                borderColorId: emblemJson["borderColorId"].intValue,
                backgroundColor: emblemJson["backgroundColor"].stringValue,
                backgroundColorId: emblemJson["backgroundColorId"].intValue
            )
        }
        
    }
    
}
