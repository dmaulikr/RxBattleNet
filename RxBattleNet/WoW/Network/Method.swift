//
//  Method.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 05/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

public extension WoW {
    
    public enum Method {
        case Achievement(id: Int)
        case BossMasterList
        case Boss(id: Int)
        case Character(name: String, realm: String, fields: [WoW.Character.Fields])
        case Item(id: Int)
        case ItemSet(id: Int)
        case RealmStatus
        case Spell(id: Int)
        
        case Battlegroups
        case CharacterRaces
        case CharacterClasses
        case CharacterAchievements
        case GuildRewards
        case GuildPerks
        case GuildAchievements
        case ItemClasses
        case PetTypes
        
        internal func path() -> String {
            switch self {
            case .Achievement(let id): return "/wow/achievement/\(id)"
            case .BossMasterList: return "/wow/boss/"
            case .Boss(let id): return "/wow/boss/\(id)"
            case .Character(let name, let realm, _): return "/wow/character/\(realm)/\(name)"
            case .Item(let id): return "/wow/item/\(id)"
            case .ItemSet(let id): return "/wow/item/set/\(id)"
            case .RealmStatus: return "/wow/realm/status"
            case .Spell(let id): return "/wow/spell/\(id)"

            case .Battlegroups: return "/wow/data/battlegroups/"
            case .CharacterRaces: return "/wow/data/character/races"
            case .CharacterClasses: return "/wow/data/character/classes"
            case .CharacterAchievements: return "/wow/data/character/achievements"
            case .GuildRewards: return "/wow/data/guild/rewards"
            case .GuildPerks: return "/wow/data/guild/perks"
            case .GuildAchievements: return "/wow/data/guild/achievements"
            case .ItemClasses: return "/wow/data/item/classes"
            case .PetTypes: return "/wow/data/pet/types"
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
            case .ItemClasses: return "classes"
            case .PetTypes: return "petTypes"
            
            default: return nil
            }
        }
    }
    
}
