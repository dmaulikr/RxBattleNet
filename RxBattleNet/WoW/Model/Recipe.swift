//
//  Recipe.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {

    public struct Recipe: Model {
        
        // MARK: - Properties
        
        public let icon: String
        public let id: Int
        public let name: String
        public let profession: String
        
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.icon = json["icon"].stringValue
            self.id = json["id"].intValue
            self.name = json["name"].stringValue
            self.profession = json["profession"].stringValue
        }
        
    }

}
