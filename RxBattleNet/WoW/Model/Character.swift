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
        
        public enum Fields: String {
            case Achievements = "achievements"
            case Appearance = "appearance"
            case Feed = "feed"
            case Guild = "guild"
            case HunterPets = "hunterPets"
            case Items = "items"
            case Mounts = "mounts"
            case Pets = "pets"
            case PetSlots = "petSlots"
            case Professions = "professions"
            case Progression = "progression"
            case Pvp = "pvp"
            case Quests = "quests"
            case Reputation = "reputation"
            case Statistics = "statistics"
            case Stats = "stats"
            case Talents = "talents"
            case Titles = "titles"
            case Audit = "audit"
        }
        
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
        }
        
    }
    
}
