//
//  Guild.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct Guild: Model {
        
        public struct Emblem: Model {
            public let icon: Int
            public let iconColor: String
            public let iconColorId: Int
            public let border: Int
            public let borderColor: String
            public let borderColorId: Int
            public let backgroundColor: String
            public let backgroundColorId: Int
            
            internal init(json: JSON) {
                self.icon = json["icon"].intValue
                self.iconColor = json["iconColor"].stringValue
                self.iconColorId = json["iconColorId"].intValue
                self.border = json["border"].intValue
                self.borderColor = json["borderColor"].stringValue
                self.borderColorId = json["borderColorId"].intValue
                self.backgroundColor = json["backgroundColor"].stringValue
                self.backgroundColorId = json["backgroundColorId"].intValue
            }
        }
        
        // MARK: - Properties
        
        public let name: String
        public let realm: String
        public let battlegroup: String
        public let level: Int
        public let side: Int
        public let lastModified: Int
        public let members: Int
        public let achievementPoints: Int
        public let emblem: WoW.Guild.Emblem
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.name = json["name"].stringValue
            self.realm = json["realm"].stringValue
            self.battlegroup = json["battlegroup"].stringValue
            self.level = json["level"].intValue
            self.side = json["side"].intValue
            self.lastModified = json["lastModified"].intValue
            self.members = json["members"].intValue
            self.achievementPoints = json["achievementPoints"].intValue
            self.emblem = WoW.Guild.Emblem(json: json["emblem"])
        }
        
    }
    
}
