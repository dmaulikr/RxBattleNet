//
//  GuildPerk.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct GuildPerk: Model {
        
        // MARK: - Properties
        
        public let guildLevel: Int
        // WARNING: API returns full model, connect once model is available
        public let spell: Int
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.guildLevel = json["guildLevel"].intValue
            self.spell = json["spell"]["id"].intValue
        }
        
    }
    
}
