//
//  PetType.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct PetType: Model {
        
        // MARK: - Properties
        
        public let id: Int
        public let key: String
        public let name: String
        public let typeAbilityId: Int
        public let strongAgainstId: Int
        public let weakAgainstId: Int
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.id = json["id"].intValue
            self.key = json["key"].stringValue
            self.name = json["name"].stringValue
            self.typeAbilityId = json["typeAbilityId"].intValue
            self.strongAgainstId = json["strongAgainstId"].intValue
            self.weakAgainstId = json["weakAgainstId"].intValue
        }
        
    }
    
}
