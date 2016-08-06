//
//  Method.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 05/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

public extension WoW {
    
    public enum Method {
        case Battlegroups
        case BossMasterList
        case Boss(id: Int)
        case Character(name: String, realm: String, fields: [WoW.Character.Fields])
        case CharacterRaces
        case CharacterClasses
        case RealmStatus
        
        internal func path() -> String {
            switch self {
            case .Battlegroups: return "/wow/data/battlegroups/"
            case .BossMasterList: return "/wow/boss/"
            case .Boss(let id): return "/wow/boss/\(id)"
            case .Character(let name, let realm, _): return "/wow/character/\(realm)/\(name)"
            case .CharacterRaces: return "/wow/data/character/races"
            case .CharacterClasses: return "/wow/data/character/classes"
            case .RealmStatus: return "/wow/realm/status"
            }
        }
        
        internal func collectionKey() -> String? {
            switch self {
            case .Battlegroups: return "battlegroups"
            case .BossMasterList: return "bosses"
            case .CharacterRaces: return "races"
            case .CharacterClasses: return "classes"
            case .RealmStatus: return "realms"
            default: return nil
            }
        }
    }
    
}
