//
//  PetSpecies.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct PetSpecies: Model {
        
        // MARK: - Properties
        
        public let abilities: [WoW.PetAbility]
        public let canBattle: Bool
        public let creatureId: Int
        public let descriptionField: String
        public let icon: String
        public let name: String
        public let petTypeId: Int
        public let source: String
        public let speciesId: Int
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.abilities = json["abilities"].map { WoW.PetAbility(json: $1) }
            self.canBattle = json["canBattle"].boolValue
            self.creatureId = json["creatureId"].intValue
            self.descriptionField = json["description"].stringValue
            self.icon = json["icon"].stringValue
            self.name = json["name"].stringValue
            self.petTypeId = json["petTypeId"].intValue
            self.source = json["source"].stringValue
            self.speciesId = json["speciesId"].intValue
        }
        
    }
    
}
