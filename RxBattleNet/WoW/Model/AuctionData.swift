//
//  AuctionData.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
 
    public struct AuctionData: Model {
        
        public struct Realm: Model {
            public let name: String
            public let slug: String
            
            internal init(json: JSON) {
                self.name = json["name"].stringValue
                self.slug = json["slug"].stringValue
            }
        }
        
        public struct Auction: Model {
            public let auc: Int
            public let item: Int
            public let owner: String
            public let ownerRealm: String
            public let bid: Int
            public let buyout: Int
            public let quantity: Int
            public let timeLeft: String
            public let rand: Int
            public let seed: Int
            public let context: Int
            
            internal init(json: JSON) {
                self.auc = json["auc"].intValue
                self.item = json["item"].intValue
                self.owner = json["owner"].stringValue
                self.ownerRealm = json["ownerRealm"].stringValue
                self.bid = json["bid"].intValue
                self.buyout = json["buyout"].intValue
                self.quantity = json["quantity"].intValue
                self.timeLeft = json["timeLeft"].stringValue
                self.rand = json["rand"].intValue
                self.seed = json["seed"].intValue
                self.context = json["context"].intValue
            }
        }
        
        // MARK: - Properties
        
        public let realms: [WoW.AuctionData.Realm]
        public let auctions: [WoW.AuctionData.Auction]
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.realms = json["realms"].map { WoW.AuctionData.Realm(json: $1) }
            self.auctions = json["auctions"].map { WoW.AuctionData.Auction(json: $1) }
        }
        
    }
    
}
