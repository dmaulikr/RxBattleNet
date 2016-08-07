//
//  Talents.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct Talents: Model {
        
        public struct CharacterSpec: Model {
            public let backgroundImage: String
            public let descriptionField: String
            public let icon: String
            public let name: String
            public let order: Int
            public let role: String
            
            internal init(json: JSON) {
                self.backgroundImage = json["backgroundImage"].stringValue
                self.descriptionField = json["description"].stringValue
                self.icon = json["icon"].stringValue
                self.name = json["name"].stringValue
                self.order = json["order"].intValue
                self.role = json["role"].stringValue
            }
        }
        
        public struct Talent: Model {
            public let column: Int
            public let spell: WoW.Spell
            public let tier: Int
            public let spec: WoW.Talents.CharacterSpec
            
            internal init(json: JSON) {
                self.column = json["column"].intValue
                self.spell = WoW.Spell(json: json["spell"])
                self.tier = json["tier"].intValue
                self.spec = WoW.Talents.CharacterSpec(json: json["spec"])
            }
        }
        
        // MARK: - Properties
        
        public let characterClass: String
        public let characterSpecs: [WoW.Talents.CharacterSpec]
        public let talents: [[[WoW.Talents.Talent]]]
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.characterClass = json["class"].stringValue
            self.characterSpecs = json["specs"].map { WoW.Talents.CharacterSpec(json: $1) }
            self.talents = json["talents"].map { (_, row) in
                row.map { (_, column) in
                    column.map { (_, spec) in
                        WoW.Talents.Talent(json: spec)
                    }
                }
            }
        }
        
    }
    
}
