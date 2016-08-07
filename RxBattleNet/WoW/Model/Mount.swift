//
//  Mount.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
 
    public struct Mount: Model {
        
        // MARK: - Properties
        
        public let name: String
        public let spellId: Int
        public let creatureId: Int
        public let itemId: Int
        public let qualityId: Int
        public let icon: String
        public let isGround: Bool
        public let isFlying: Bool
        public let isAquatic: Bool
        public let isJumping: Bool
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.name = json["name"].stringValue
            self.spellId = json["spellId"].intValue
            self.creatureId = json["creatureId"].intValue
            self.itemId = json["itemId"].intValue
            self.qualityId = json["qualityId"].intValue
            self.icon = json["icon"].stringValue
            self.isGround = json["isGround"].boolValue
            self.isFlying = json["isFlying"].boolValue
            self.isAquatic = json["isAquatic"].boolValue
            self.isJumping = json["isJumping"].boolValue
        }
        
    }
    
}
