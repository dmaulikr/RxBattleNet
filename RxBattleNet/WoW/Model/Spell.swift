//
//  Spell.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct Spell: Model {
        
        // MARK: - Properties
        
        public let id: Int
        public let name: String
        public let subtext: String
        public let icon: String
        public let description: String
        public let castTime: String
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.id = json["id"].intValue
            self.name = json["name"].stringValue
            self.subtext = json["subtext"].stringValue
            self.icon = json["icon"].stringValue
            self.description = json["description"].stringValue
            self.castTime = json["castTime"].stringValue
        }
        
    }
    
}
