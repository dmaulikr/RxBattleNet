//
//  AuctionDataStatus.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct AuctionDataStatus: Model {
        
        // MARK: - Properties
        
        public let url: String
        public let lastModified: Int
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.url = json["url"].stringValue
            self.lastModified = json["lastModified"].intValue
        }
        
    }
    
}
