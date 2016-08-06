//
//  GuildReward.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct GuildReward: Model {
        
        // MARK: - Properties
        
        public let minGuildLevel: Int
        public let minGuildRepLevel: Int
        public let races: [Int]
        public let achievement: WoW.Achievement
        public let item: WoW.Item
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.minGuildLevel = json["minGuildLevel"].intValue
            self.minGuildRepLevel = json["minGuildRepLevel"].intValue
            self.races = json["races"].map { $1.intValue }
            self.achievement = WoW.Achievement(json: json["achievement"])
            self.item = WoW.Item(json: json["item"])
        }
        
    }
    
}
