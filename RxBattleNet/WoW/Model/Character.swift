//
//  Character.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct Character: Model {
        
        // MARK: - Properties
        
        public let name: String
        public let realm: String
        public let race: Int
        public let characterClass: Int
        public let gender: Int
        public let level: Int
        public let faction: Int
        public let battlegroup: String
        public let lastModified: Int
        public let achievementPoints: Int
        public let calcClass: String
        public let totalHonorableKills: Int
        public let thumbnail: String
        
        public let achievements: WoW.Character.Achievements?
        public let appearance: WoW.Character.Appearance?
        public let guild: WoW.Character.Guild?
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.name = json["name"].stringValue
            self.realm = json["realm"].stringValue
            self.race = json["race"].intValue
            self.characterClass = json["class"].intValue
            self.gender = json["gender"].intValue
            self.level = json["level"].intValue
            self.faction = json["faction"].intValue
            self.battlegroup = json["battlegroup"].stringValue
            self.lastModified = json["lastModified"].intValue
            self.achievementPoints = json["achievementPoints"].intValue
            self.calcClass = json["calcClass"].stringValue
            self.totalHonorableKills = json["totalHonorableKills"].intValue
            self.thumbnail = json["thumbnail"].stringValue
            
            self.achievements = json["achievements"].isExists() ? WoW.Character.Achievements(json: json["achievements"]) : nil
            self.appearance = json["appearance"].isExists() ? WoW.Character.Appearance(json: json["appearance"]) : nil
            self.guild = json["guild"].isExists() ? WoW.Character.Guild(json: json["guild"]) : nil
        }
        
    }
    
}
