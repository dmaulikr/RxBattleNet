//
//  CharacterFields.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 06/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

public extension WoW.Character {
    
    public enum Fields: String {
        /**
         * A map of achievement data including completion timestamps and criteria information.
         */
        case Achievements = "achievements"
        
        /**
         * A map of a character's appearance settings such as which face texture they've selected and whether or not a healm is visible.
         */
        case Appearance = "appearance"
        
        /**
         * The activity feed of the character.
         */
        case Feed = "feed"
        
        /**
         * A summary of the guild that the character belongs to. If the character does not belong to a guild and this field is requested, this field will not be exposed.
         *
         * When a guild is requested, a map is returned with key/value pairs that describe a basic set of guild information. Note that the rank of the character is not included in this block as it describes a guild and not a membership of the guild. To retrieve the character's rank within the guild, you must specific a separate request to the guild profile resource.
         */
        case Guild = "guild"
        
        /**
         * A list of all of the combat pets obtained by the character.
         */
        case HunterPets = "hunterPets"
        
        /**
         * A list of items equipped by the character. Use of this field will also include the average item level and average item level equipped for the character.
         *
         * When the `items` field is used, a map structure is returned that contains information on the equipped items of that character as well as the average item level of the character.
         */
        case Items = "items"
        
        /**
         * A list of all of the mounts obtained by the character.
         */
        case Mounts = "mounts"
        
        /**
         * A list of the battle pets obtained by the character.
         */
        case Pets = "pets"
        
        /**
         * Data about the current battle pet slots on this characters account.
         *
         * The pet slot contains which slot it is and whether the slot is empty or locked. We also include the `battlePetId` which is unique for this character and can be used to match a zbattlePetIdz in the pets field for this character. The ability list is the list of 3 active abilities on that pet. If the pet is not high enough level than it will always be the first three abilities that the pet has.
         */
        case PetSlots = "petSlots"
        
        /**
         * A list of the character's professions. Does not include class professions.
         */
        case Professions = "professions"
        
        /**
         * A list of raids and bosses indicating raid progression and completeness.
         */
        case Progression = "progression"
        
        /**
         * A map of pvp information including arena team membership and rated battlegrounds information.
         */
        case Pvp = "pvp"
        
        /**
         * A list of quests completed by the character.
         */
        case Quests = "quests"
        
        /**
         * A list of the factions that the character has an associated reputation with.
         */
        case Reputation = "reputation"
        
        /**
         * A map of character statistics.
         */
        case Statistics = "statistics"
        
        /**
         * A map of character attributes and stats.
         */
        case Stats = "stats"
        
        /**
         * A list of talent structures.
         */
        case Talents = "talents"
        
        /**
         * A list of the titles obtained by the character including the currently selected title.
         */
        case Titles = "titles"
        
        /**
         * Raw character audit data that powers the character audit on the game site.
         */
        case Audit = "audit"
    }
    
}
