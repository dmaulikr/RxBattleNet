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
        case Character(name: String, realm: String, fields: [WoW.Character.Fields])
        case RealmStatus
        
        internal func path() -> String {
            switch self {
            case .BossMasterList: return "/wow/boss/"
            case .Boss(let id): return "/wow/boss/\(id)"
            case .Character(let name, let realm, _): return "/wow/character/\(realm)/\(name)"
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
