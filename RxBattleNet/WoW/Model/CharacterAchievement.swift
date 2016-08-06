//
//  CharacterAchievement.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct CharacterAchievement {
        
        public struct Category: Model {
        
            // MARK: - Properties
            
            public let id: Int
            public let name: String
            public let categories: [WoW.CharacterAchievement.Category]
            public let achievements: [WoW.CharacterAchievement.Achievement]
            
            // MARK: - Init
            
            internal init(json: JSON) {
                self.id = json["id"].intValue
                self.name = json["name"].stringValue
                self.categories = json["categories"].map { WoW.CharacterAchievement.Category(json: $1) }
                self.achievements = json["achievements"].map { WoW.CharacterAchievement.Achievement(json: $1) }
            }
            
        }
        
        public struct Achievement: Model {
            
            public struct Criteria: Model {
            
                // MARK: - Properties
                
                public let id: Int
                public let description: String
                public let orderIndex: Int
                public let max: Int
                
                // MARK: - Init
                
                internal init(json: JSON) {
                    self.id = json["id"].intValue
                    self.description = json["description"].stringValue
                    self.orderIndex = json["orderIndex"].intValue
                    self.max = json["max"].intValue
                }
            }
            
            // MARK: - Properties
            
            public let id: Int
            public let title: String
            public let points: Int
            public let description: String
            public let rewardItems: [Int]
            public let icon: String
            public let accountWide: Bool
            public let factionId: Int
            public let criteria: [WoW.CharacterAchievement.Achievement.Criteria]
            
            // MARK: - Init
            
            internal init(json: JSON) {
                self.id = json["id"].intValue
                self.title = json["title"].stringValue
                self.points = json["points"].intValue
                self.description = json["description"].stringValue
                self.rewardItems = json["rewardItems"].map { $1["id"].intValue }
                self.icon = json["icon"].stringValue
                self.accountWide = json["accountWide"].boolValue
                self.factionId = json["factionId"].intValue
                self.criteria = json["criteria"].map { WoW.CharacterAchievement.Achievement.Criteria(json: $1) }
            }
            
        }
        
    }
    
}
