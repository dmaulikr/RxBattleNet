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
        public let spell: WoW.Spell
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.guildLevel = json["guildLevel"].intValue
            self.spell = WoW.Spell(json: json["spell"])
        }
        
    }
    
}
