//
//  Method.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 05/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

internal extension WoW {
    
    enum Method {
        case Achievement(id: Int)
        case AuctionDataStatus(realm: String)
        case BossMasterList
        case Boss(id: Int)
        case Challenge(realm: String)
        case ChallengeRegion
        case Character(name: String, realm: String, fields: [WoW.Character.Fields])
        case Item(id: Int)
        case ItemSet(id: Int)
        case MountMasterList
        case PetMasterList
        case PetAbility(id: Int)
        case PetSpecies(id: Int)
        case PetStats(speciesID: Int, level: Int?, breedId: Int?, qualityId: Int?)
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
        
        func path() -> String {
            switch self {
            case .Achievement(let id): return "/wow/achievement/\(id)"
            case .AuctionDataStatus(let realm): return "/wow/auction/data/\(realm)"
            case .BossMasterList: return "/wow/boss/"
            case .Boss(let id): return "/wow/boss/\(id)"
            case .Challenge(let realm): return "/wow/challenge/\(realm)"
            case .ChallengeRegion: return "/wow/challenge/region"
            case .Character(let name, let realm, _): return "/wow/character/\(realm)/\(name)"
            case .Item(let id): return "/wow/item/\(id)"
            case .ItemSet(let id): return "/wow/item/set/\(id)"
            case .MountMasterList: return "/wow/mount/"
            case .PetMasterList: return "/wow/pet/"
            case .PetAbility(let id): return "/wow/pet/ability/\(id)"
            case .PetSpecies(let id): return "/wow/pet/species/\(id)"
            case .PetStats(let speciesId, _, _, _): return "/wow/pet/stats/\(speciesId)"
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
        
        func collectionKey() -> String? {
            switch self {
            case .AuctionDataStatus: return "files"
            case .BossMasterList: return "bosses"
            case .Challenge: return "challenge"
            case .ChallengeRegion: return "challenge"
            case .MountMasterList: return "mounts"
            case .PetMasterList: return "pets"
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
