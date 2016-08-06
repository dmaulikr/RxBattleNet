//
//  Method.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 05/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

public extension WoW {
    
    public enum Method {
        case BossMasterList
        case Boss(id: Int)
        case RealmStatus
        
        internal func path() -> String {
            switch self {
            case .BossMasterList: return "/wow/boss/"
            case .Boss(let id): return "/wow/boss/\(id)"
            case .RealmStatus: return "/wow/realm/status"
            }
        }
        
        internal func collectionKey() -> String? {
            switch self {
            case .BossMasterList: return "bosses"
            case .RealmStatus: return "realms"
            default: return nil
            }
        }
    }
    
}
