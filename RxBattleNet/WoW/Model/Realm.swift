//
//  Realm.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct Realm: Model {
        
        // MARK: - Properties
        
        public let name: String
        public let slug: String
        public let locale: String
        public let timezone: String
        public let status: Bool
        public let queue: Bool
        public let population: String
        public let type: String
        public let battlegroup: String
        public let connectedRealms: [String]
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.name = json["name"].stringValue
            self.slug = json["slug"].stringValue
            self.locale = json["locale"].stringValue
            self.timezone = json["timezone"].stringValue
            self.status = json["status"].boolValue
            self.queue = json["queue"].boolValue
            self.population = json["population"].stringValue
            self.type = json["type"].stringValue
            self.battlegroup = json["battlegroup"].stringValue
            self.connectedRealms = json["connected_realms"].map { $1.stringValue }
        }
        
    }
    
}
