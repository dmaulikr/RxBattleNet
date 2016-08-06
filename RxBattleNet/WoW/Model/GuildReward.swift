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
        // WARNING: API returns full model, connect once model is available
        public let achievement: Int
        public let item: Int
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.minGuildLevel = json["minGuildLevel"].intValue
            self.minGuildRepLevel = json["minGuildRepLevel"].intValue
            self.achievement = json["achievement"]["id"].intValue
            self.item = json["item"]["id"].intValue
        }
        
    }
    
}
