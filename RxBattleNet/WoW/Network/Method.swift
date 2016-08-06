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
        
        case Battlegroups
        case CharacterRaces
        case CharacterClasses
        case CharacterAchievements
        case GuildRewards
        case GuildPerks
        case GuildAchievements
        
        internal func path() -> String {
            switch self {
            case .BossMasterList: return "/wow/boss/"
            case .Boss(let id): return "/wow/boss/\(id)"
            case .Character(let name, let realm, _): return "/wow/character/\(realm)/\(name)"
            case .RealmStatus: return "/wow/realm/status"

            case .Battlegroups: return "/wow/data/battlegroups/"
            case .CharacterRaces: return "/wow/data/character/races"
            case .CharacterClasses: return "/wow/data/character/classes"
            case .CharacterAchievements: return "/wow/data/character/achievements"
            case .GuildRewards: return "/wow/data/guild/rewards"
            case .GuildPerks: return "/wow/data/guild/perks"
            case .GuildAchievements: return "/wow/data/guild/achievements"
            }
        }
        
        internal func collectionKey() -> String? {
            switch self {
            case .BossMasterList: return "bosses"
            case .RealmStatus: return "realms"
            
            case .Battlegroups: return "battlegroups"
            case .CharacterRaces: return "races"
            case .CharacterClasses: return "classes"
            case .CharacterAchievements: return "achievements"
            case .GuildRewards: return "rewards"
            case .GuildPerks: return "perks"
            case .GuildAchievements: return "achievements"
            
            default: return nil
            }
        }
    }
    
}
