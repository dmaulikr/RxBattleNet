//
//  Boss.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct Boss: Model {
        
        public struct NPC {
            public let id: Int
            public let name: String
            public let urlSlug: String
        }
        
        // MARK: - Properties
        
        public let id: Int
        public let name: String
        public let urlSlug: String
        public let description: String
        public let zoneId: Int
        public let availableInNormalMode: Bool
        public let availableInHeroicMode: Bool
        public let health: Int
        public let heroicHealth: Int
        public let level: Int
        public let heroicLevel: Int
        public let journalId: Int
        public let npcs: [WoW.Boss.NPC]
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.id = json["id"].intValue
            self.name = json["name"].stringValue
            self.urlSlug = json["urlSlug"].stringValue
            self.description = json["description"].stringValue
            self.zoneId = json["zoneId"].intValue
            self.availableInNormalMode = json["availableInNormalMode"].boolValue
            self.availableInHeroicMode = json["availableInHeroicMode"].boolValue
            self.health = json["health"].intValue
            self.heroicHealth = json["heroicHealth"].intValue
            self.level = json["level"].intValue
            self.heroicLevel = json["heroicLevel"].intValue
            self.journalId = json["journalId"].intValue
            self.npcs = json["npcs"].map { (_, value) in
                WoW.Boss.NPC(
                    id: value["id"].intValue,
                    name: value["name"].stringValue,
                    urlSlug: value["urlSlug"].stringValue
                )
            }
        }
        
    }
    
}
