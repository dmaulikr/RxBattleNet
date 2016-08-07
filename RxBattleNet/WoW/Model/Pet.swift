//
//  Pet.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
 
    public struct Pet: Model {
        
        public struct Stats: Model {
            public let speciesId: Int
            public let breedId: Int
            public let petQualityId: Int
            public let level: Int
            public let health: Int
            public let power: Int
            public let speed: Int
            
            internal init(json: JSON) {
                self.speciesId = json["speciesId"].intValue
                self.breedId = json["breedId"].intValue
                self.petQualityId = json["petQualityId"].intValue
                self.level = json["level"].intValue
                self.health = json["health"].intValue
                self.power = json["power"].intValue
                self.speed = json["speed"].intValue
            }
        }
 
        // MARK: - Properties
        
        public let canBattle: Bool
        public let creatureId: Int
        public let name: String
        public let family: String
        public let icon: String
        public let qualityId: Int
        public let stats: WoW.Pet.Stats
        public let strongAgainst: [String]
        public let typeId: Int
        public let weakAgainst: [String]
 
        // MARK: - Init
        
        internal init(json: JSON) {
            self.canBattle = json["canBattle"].boolValue
            self.creatureId = json["creatureId"].intValue
            self.name = json["name"].stringValue
            self.family = json["family"].stringValue
            self.icon = json["icon"].stringValue
            self.qualityId = json["qualityId"].intValue
            self.stats = WoW.Pet.Stats(json: json["stats"])
            self.strongAgainst = json["strongAgainst"].map { $1.stringValue }
            self.typeId = json["typeId"].intValue
            self.weakAgainst = json["weakAgainst"].map { $1.stringValue }
        }
        
    }
    
}
