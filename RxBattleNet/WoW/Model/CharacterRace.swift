//
//  CharacterRace.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct CharacterRace: Model {
        
        // MARK: - Properties
        
        public let id: Int
        public let name: String
        public let side: String
        public let mask: Int
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.id = json["id"].intValue
            self.name = json["name"].stringValue
            self.side = json["side"].stringValue
            self.mask = json["mask"].intValue
        }
        
    }
    
}
