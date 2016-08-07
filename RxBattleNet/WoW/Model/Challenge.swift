//
//  Challenge.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct Challenge: Model {
        
        public struct Time: Model {
            public let time: Int
            public let hours: Int
            public let minutes: Int
            public let seconds: Int
            public let milliseconds: Int
            public let isPositive: Bool
            
            internal init(json: JSON) {
                self.time = json["time"].intValue
                self.hours = json["hours"].intValue
                self.minutes = json["minutes"].intValue
                self.seconds = json["seconds"].intValue
                self.milliseconds = json["milliseconds"].intValue
                self.isPositive = json["isPositive"].boolValue
            }
        }
        
        public struct Map: Model {
            public let id: Int
            public let name: String
            public let slug: String
            public let hasChallengeMode: Bool
            public let bronzeCriteria: WoW.Challenge.Time
            public let silverCriteria: WoW.Challenge.Time
            public let goldCriteria: WoW.Challenge.Time
            
            internal init(json: JSON) {
                self.id = json["id"].intValue
                self.name = json["name"].stringValue
                self.slug = json["slug"].stringValue
                self.hasChallengeMode = json["hasChallengeMode"].boolValue
                self.bronzeCriteria = WoW.Challenge.Time(json: json["bronzeCriteria"])
                self.silverCriteria = WoW.Challenge.Time(json: json["silverCriteria"])
                self.goldCriteria = WoW.Challenge.Time(json: json["goldCriteria"])
            }
        }
        
        public struct Group: Model {
 
            public struct Member: Model {
 
                public struct Spec: Model {
                    public let name: String
                    public let role: String
                    public let backgroundImage: String
                    public let icon: String
                    public let description: String
                    public let order: Int
                    
                    internal init(json: JSON) {
                        self.name = json["name"].stringValue
                        self.role = json["role"].stringValue
                        self.backgroundImage = json["backgroundImage"].stringValue
                        self.icon = json["icon"].stringValue
                        self.description = json["description"].stringValue
                        self.order = json["order"].intValue
                    }
                }
                
                public let character: WoW.Character
                public let spec: WoW.Challenge.Group.Member.Spec
 
                internal init(json: JSON) {
                    self.character = WoW.Character(json: json["character"])
                    self.spec = WoW.Challenge.Group.Member.Spec(json: json["spec"])
                }
            }
            
            public let ranking: Int
            public let time: WoW.Challenge.Time
            public let date: String
            public let medal: String
            public let faction: String
            public let isRecurring: Bool
            public let members: [WoW.Challenge.Group.Member]
            
            internal init(json: JSON) {
                self.ranking = json["ranking"].intValue
                self.time = WoW.Challenge.Time(json: json["time"])
                self.date = json["date"].stringValue
                self.medal = json["medal"].stringValue
                self.faction = json["faction"].stringValue
                self.isRecurring = json["isRecurring"].boolValue
                self.members = json["members"].map { WoW.Challenge.Group.Member(json: $1) }
            }
        }
        
        // MARK: - Properties
        
        public let realm: WoW.Realm?
        public let map: WoW.Challenge.Map
        public let groups: [WoW.Challenge.Group]
        
        // MARK: - Init
        
        internal init(json: JSON) {
            let realmJson = json["realm"]
            self.realm = realmJson.isExists() ? WoW.Realm(json: realmJson) : nil
            
            self.map = WoW.Challenge.Map(json: json["map"])
            self.groups = json["groups"].map { WoW.Challenge.Group(json: $1) }
        }
        
    }
    
}
