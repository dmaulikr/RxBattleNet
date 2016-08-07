//
//  PvpRanking.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public enum PvpBracket {
        case TwoVsTwo
        case ThreeVsThree
        case FiveVsFive
        case RatedBattleground
        
        internal func toString() -> String {
            switch self {
            case .TwoVsTwo: return "2v2"
            case .ThreeVsThree: return "3v3"
            case .FiveVsFive: return "5v5"
            case .RatedBattleground: return "rbg"
            }
        }
    }
    
    public struct PvpRanking: Model {
        
        // MARK: - Properties
        
        public let classId: Int
        public let factionId: Int
        public let genderId: Int
        public let name: String
        public let raceId: Int
        public let ranking: Int
        public let rating: Int
        public let realmId: Int
        public let realmName: String
        public let realmSlug: String
        public let seasonLosses: Int
        public let seasonWins: Int
        public let specId: Int
        public let weeklyLosses: Int
        public let weeklyWins: Int
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.classId = json["classId"].intValue
            self.factionId = json["factionId"].intValue
            self.genderId = json["genderId"].intValue
            self.name = json["name"].stringValue
            self.raceId = json["raceId"].intValue
            self.ranking = json["ranking"].intValue
            self.rating = json["rating"].intValue
            self.realmId = json["realmId"].intValue
            self.realmName = json["realmName"].stringValue
            self.realmSlug = json["realmSlug"].stringValue
            self.seasonLosses = json["seasonLosses"].intValue
            self.seasonWins = json["seasonWins"].intValue
            self.specId = json["specId"].intValue
            self.weeklyLosses = json["weeklyLosses"].intValue
            self.weeklyWins = json["weeklyWins"].intValue
        }
        
    }
    
}
