//
//  AchievementCategory.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct AchievementCategory: Model {
        
        // MARK: - Properties
        
        public let id: Int
        public let name: String
        public let categories: [WoW.AchievementCategory]
        public let achievements: [WoW.Achievement]
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.id = json["id"].intValue
            self.name = json["name"].stringValue
            self.categories = json["categories"].map { WoW.AchievementCategory(json: $1) }
            self.achievements = json["achievements"].map { WoW.Achievement(json: $1) }
        }
        
    }
    
}
