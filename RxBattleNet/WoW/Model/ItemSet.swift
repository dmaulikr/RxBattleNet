//
//  ItemSet.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct ItemSet: Model {
        
        public struct Bonus: Model {
            public let description: String
            public let threshold: Int
            
            internal init(json: JSON) {
                self.description = json["description"].stringValue
                self.threshold = json["threshold"].intValue
            }
        }
        
        // MARK: - Properties
        
        public let id: Int
        public let name: String
        public let setBonuses: [WoW.ItemSet.Bonus]
        public let items: [Int]
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.id = json["id"].intValue
            self.name = json["name"].stringValue
            self.setBonuses = json["setBonuses"].map { WoW.ItemSet.Bonus(json: $1) }
            self.items = json["items"].map { $1.intValue }
        }
        
    }
    
}
