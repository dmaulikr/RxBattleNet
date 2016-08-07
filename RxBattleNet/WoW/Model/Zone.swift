//
//  Zone.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct Zone: Model {
        
        public struct Location: Model {
            public let id: Int
            public let name: String

            internal init(json: JSON) {
                self.id = json["id"].intValue
                self.name = json["name"].stringValue
            }
        }
        
        // MARK: - Properties
        
        public let advisedHeroicMaxLevel: Int
        public let advisedHeroicMinLevel: Int
        public let advisedMaxLevel: Int
        public let advisedMinLevel: Int
        public let availableModes: [String]
        public let bosses: [WoW.Boss]
        public let descriptionField: String
        public let expansionId: Int
        public let floors: Int
        public let id: Int
        public let isDungeon: Bool
        public let isRaid: Bool
        public let lfgHeroicMinGearLevel: Int
        public let lfgNormalMinGearLevel: Int
        public let location: WoW.Zone.Location
        public let name: String
        public let numPlayers: String
        public let urlSlug: String
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.advisedHeroicMaxLevel = json["advisedHeroicMaxLevel"].intValue
            self.advisedHeroicMinLevel = json["advisedHeroicMinLevel"].intValue
            self.advisedMaxLevel = json["advisedMaxLevel"].intValue
            self.advisedMinLevel = json["advisedMinLevel"].intValue
            self.availableModes = json["availableModes"].map { $1.stringValue }
            self.bosses = json["bosses"].map { WoW.Boss(json: $1) }
            self.descriptionField = json["description"].stringValue
            self.expansionId = json["expansionId"].intValue
            self.floors = json["floors"].intValue
            self.id = json["id"].intValue
            self.isDungeon = json["isDungeon"].boolValue
            self.isRaid = json["isRaid"].boolValue
            self.lfgHeroicMinGearLevel = json["lfgHeroicMinGearLevel"].intValue
            self.lfgNormalMinGearLevel = json["lfgNormalMinGearLevel"].intValue
            self.location = WoW.Zone.Location(json: json["location"])
            self.name = json["name"].stringValue
            self.numPlayers = json["numPlayers"].stringValue
            self.urlSlug = json["urlSlug"].stringValue
        }
        
    }
    
}
