//
//  Quest.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {

    public struct Quest: Model {
        
        // MARK: - Properties
        
        public let category: String
        public let id: Int
        public let level: Int
        public let reqLevel: Int
        public let suggestedPartyMembers: Int
        public let title: String
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.category = json["category"].stringValue
            self.id = json["id"].intValue
            self.level = json["level"].intValue
            self.reqLevel = json["reqLevel"].intValue
            self.suggestedPartyMembers = json["suggestedPartyMembers"].intValue
            self.title = json["title"].stringValue
        }
        
    }

}
