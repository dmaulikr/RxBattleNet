//
//  PetStats.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct PetStats: Model {
        
        // MARK: - Properties
        
        public let speciesId: Int
        public let breedId: Int
        public let petQualityId: Int
        public let level: Int
        public let health: Int
        public let power: Int
        public let speed: Int
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.speciesId = json["speciesId"].intValue
            self.breedId = json["breedId"].intValue
            self.petQualityId = json["petQualityId"].intValue
            self.level = json["level"].intValue
            self.health = json["health"].intValue
            self.power = json["power"].intValue
            self.speed = json["speed"].intValue
        }
    }
    
}
