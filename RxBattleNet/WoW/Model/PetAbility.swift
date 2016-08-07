//
//  PetAbility.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct PetAbility: Model {
        
        // MARK: - Properties
        
        public let cooldown: Int
        public let hideHints: Bool
        public let icon: String
        public let id: Int
        public let isPassive: Bool
        public let name: String
        public let petTypeId: Int
        public let rounds: Int
        public let order: Int
        public let requiredLevel: Int
        public let slot: Int
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.cooldown = json["cooldown"].intValue
            self.hideHints = json["hideHints"].boolValue
            self.icon = json["icon"].stringValue
            self.id = json["id"].intValue
            self.isPassive = json["isPassive"].boolValue
            self.name = json["name"].stringValue
            self.petTypeId = json["petTypeId"].intValue
            self.rounds = json["rounds"].intValue
            self.order = json["order"].intValue
            self.requiredLevel = json["requiredLevel"].intValue
            self.slot = json["slot"].intValue
        }
        
    }
    
}
