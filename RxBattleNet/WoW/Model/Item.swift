//
//  Item.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import SwiftyJSON

public extension WoW {
    
    public struct Item: Model {
        
        public struct BonusStat: Model {
            
            // MARK: - Properties
            
            public let stat: Int
            public let amount: Int
            
            // MARK: - Init
            
            internal init(json: JSON) {
                self.stat = json["stat"].intValue
                self.amount = json["amount"].intValue
            }
            
        }
        
        public struct Spell: Model {
            
            // MARK: - Properties
            
            public let spellId: Int
            public let spell: WoW.Spell
            public let nCharges: Int
            public let consumable: Bool
            public let categoryId: Int
            public let trigger: String
            
            // MARK: - Init
            
            internal init(json: JSON) {
                self.spellId = json["spellId"].intValue
                self.spell = WoW.Spell(json: json["spell"])
                self.nCharges = json["nCharges"].intValue
                self.consumable = json["consumable"].boolValue
                self.categoryId = json["categoryId"].intValue
                self.trigger = json["trigger"].stringValue
            }
            
        }
        
        public struct WeaponInfo: Model {
            
            public struct Damage {
                public let min: Int
                public let max: Int
                public let exactMin: Int
                public let exactMax: Int
            }
            
            // MARK: - Properties
            
            public let damage: WoW.Item.WeaponInfo.Damage
            public let weaponSpeed: Double
            public let dps: Double
            
            // MARK: - Init
            
            internal init(json: JSON) {
                let damageJson = json["damage"]
                self.damage = WoW.Item.WeaponInfo.Damage(
                    min: damageJson["min"].intValue,
                    max: damageJson["max"].intValue,
                    exactMin: damageJson["exactMin"].intValue,
                    exactMax: damageJson["exactMax"].intValue
                )
                self.weaponSpeed = json["weaponSpeed"].doubleValue
                self.dps = json["dps"].doubleValue
            }
            
        }
        
        public struct Source: Model {
            
            // MARK: - Properties
            
            public let id: Int
            public let type: String
            
            // MARK: - Init
            
            internal init(json: JSON) {
                self.id = json["sourceId"].intValue
                self.type = json["sourceType"].stringValue
            }
        }
        
        public struct BonusUpgrade {
            public let id: Int
            public let name: String
            public let type: String
        }
        
        public struct BonusChanceStat {
            public let statId: Int
            public let delta: Int
            public let maxDelta: Int
        }
        
        public struct BonusChance: Model {
            
            // MARK: - Properties
            
            public let chanceType: String
            public let upgrade: WoW.Item.BonusUpgrade
            public let stats: [WoW.Item.BonusChanceStat]
            
            // MARK: - Init
            
            internal init(json: JSON) {
                self.chanceType = json["chanceType"].stringValue
                
                let upgradeJson = json["upgrade"]
                self.upgrade = WoW.Item.BonusUpgrade(
                    id: upgradeJson["id"].intValue,
                    name: upgradeJson["name"].stringValue,
                    type: upgradeJson["upgradeType"].stringValue
                )
                
                self.stats = json["stats"].map {
                    WoW.Item.BonusChanceStat(
                        statId: $1["statId"].intValue,
                        delta: $1["delta"].intValue,
                        maxDelta: $1["maxDelta"].intValue
                    )
                }
            }
        }
        
        public struct BonusSummary: Model {
            
            // MARK: - Properties
            
            public let defaultBonusLists: [Int]
            public let chanceBonusLists: [Int]
            public let bonusChances: [WoW.Item.BonusChance]
            
            // MARK: - Init
            
            internal init(json: JSON) {
                self.defaultBonusLists = json["defaultBonusLists"].map { $1.intValue }
                self.chanceBonusLists = json["chanceBonusLists"].map { $1.intValue }
                self.bonusChances = json["bonusChances"].map { WoW.Item.BonusChance(json: $1) }
            }
            
        }
        
        // MARK: - Properties
        
        public let id: Int
        public let name: String
        public let description: String
        public let disenchantingSkillRank: Int
        public let icon: String
        public let stackable: Int
        public let itemBind: Int
        public let bonusStats: [WoW.Item.BonusStat]
        public let itemSpells: [WoW.Item.Spell]
        public let buyPrice: Int
        public let itemClass: Int
        public let itemSubClass: Int
        public let containerSlots: Int
        public let weaponInfo: WoW.Item.WeaponInfo?
        public let inventoryType: Int
        public let equippable: Bool
        public let itemLevel: Int
        public let maxCount: Int
        public let maxDurability: Int
        public let minFactionId: Int
        public let minReputation: Int
        public let quality: Int
        public let sellPrice: Int
        public let requiredSkill: Int
        public let requiredLevel: Int
        public let requiredSkillRank: Int
        public let itemSource: WoW.Item.Source
        public let baseArmor: Int
        public let hasSockets: Bool
        public let isAuctionable: Bool
        public let armor: Int
        public let displayInfoId: Int
        public let nameDescription: String
        public let nameDescriptionColor: String
        public let upgradable: Bool
        public let heroicTooltip: Bool
        public let context: String
        public let bonusLists: [Int]
        public let availableContexts: [String]
        public let bonusSummary: WoW.Item.BonusSummary
        public let artifactId: Int
        
        // MARK: - Init
        
        internal init(json: JSON) {
            self.id = json["id"].intValue
            self.name = json["name"].stringValue
            self.description = json["description"].stringValue
            self.disenchantingSkillRank = json["disenchantingSkillRank"].intValue
            self.icon = json["icon"].stringValue
            self.stackable = json["stackable"].intValue
            self.itemBind = json["itemBind"].intValue
            self.bonusStats = json["bonusStats"].map { WoW.Item.BonusStat(json: $1) }
            self.itemSpells = json["itemSpells"].map { WoW.Item.Spell(json: $1) }
            self.buyPrice = json["buyPrice"].intValue
            self.itemClass = json["itemClass"].intValue
            self.itemSubClass = json["itemSubClass"].intValue
            self.containerSlots = json["containerSlots"].intValue
            self.weaponInfo = json["weaponInfo"].isExists() ? WoW.Item.WeaponInfo(json: json["weaponInfo"]) : nil
            self.inventoryType = json["inventoryType"].intValue
            self.equippable = json["equippable"].boolValue
            self.itemLevel = json["itemLevel"].intValue
            self.maxCount = json["maxCount"].intValue
            self.maxDurability = json["maxDurability"].intValue
            self.minFactionId = json["minFactionId"].intValue
            self.minReputation = json["minReputation"].intValue
            self.quality = json["quality"].intValue
            self.sellPrice = json["sellPrice"].intValue
            self.requiredSkill = json["requiredSkill"].intValue
            self.requiredLevel = json["requiredLevel"].intValue
            self.requiredSkillRank = json["requiredSkillRank"].intValue
            self.itemSource = WoW.Item.Source(json: json["itemSource"])
            self.baseArmor = json["baseArmor"].intValue
            self.hasSockets = json["hasSockets"].boolValue
            self.isAuctionable = json["isAuctionable"].boolValue
            self.armor = json["armor"].intValue
            self.displayInfoId = json["displayInfoId"].intValue
            self.nameDescription = json["nameDescription"].stringValue
            self.nameDescriptionColor = json["nameDescriptionColor"].stringValue
            self.upgradable = json["upgradable"].boolValue
            self.heroicTooltip = json["heroicTooltip"].boolValue
            self.context = json["context"].stringValue
            self.bonusLists = json["bonusLists"].map { $1.intValue }
            self.availableContexts = json["availableContexts"].map { $1.stringValue }
            self.bonusSummary = WoW.Item.BonusSummary(json: json["bonusSummary"])
            self.artifactId = json["artifactId"].intValue
        }
        
    }
    
}
