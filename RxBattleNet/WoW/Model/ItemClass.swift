//
//  ItemClass.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct ItemClass: Model {
        
        // MARK: - Properties
        
        public let id: Int
        public let name: String
        public let subclasses: [WoW.ItemClass]
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.id = json["class"].isExists() ? json["class"].intValue : json["subclass"].intValue
            self.name = json["name"].stringValue
            self.subclasses = json["subclasses"].map { WoW.ItemClass(json: $1) }
        }
        
    }
    
}
