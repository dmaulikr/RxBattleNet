//
//  Battlegroup.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct Battlegroup: Model {
        
        // MARK: - Properties
        
        public let name: String
        public let slug: String
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.name = json["name"].stringValue
            self.slug = json["slug"].stringValue
        }
        
    }
    
}
