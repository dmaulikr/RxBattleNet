//
//  RxWoW.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 05/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

public struct RxWoW {
    
    // MARK: - Properties
    
    private let apiKey: String
    private let region: WoW.Region
    private let locale: WoW.Locale
    private let networkProvider: RxNetwork
    
    // MARK: - Init
    
    /**
     * Initializes a newly created RxWoW with the specified `apiKey`, `region` and `locale`.
     *
     * - Parameter apiKey: What API key to use when querying.
     * - Parameter region: What region API to query.
     * - Parameter locale: What locale to use in responses.
     */
    public init(apiKey: String, region: WoW.Region, locale: WoW.Locale) {
        self.init(apiKey: apiKey, region: region, locale: locale, networkProvider: AlamofireNetwork())
    }
    
    internal init(apiKey: String, region: WoW.Region, locale: WoW.Locale, networkProvider: RxNetwork) {
        self.apiKey = apiKey
        self.region = region
        self.locale = locale
        self.networkProvider = networkProvider
    }
    
    // MARK: - ACHIEVEMENT API
    
    /**
     * This provides data about an individual achievement.
     *
     * - Parameter id: The ID of the achievement to retrieve.
     */
    public func achievement(id id: Int) -> Observable<WoW.Achievement> {
        return self.item(method: WoW.Method.Achievement(id: id))
    }
    
    // MARK: - AUCTION API
    
    /**
     * Auction APIs currently provide rolling batches of data about current auctions. Fetching auction dumps is a two step process that involves checking a per-realm index file to determine if a recent dump has been generated and then fetching the most recently generated dump file if necessary.
     *
     * This API resource provides a per-realm list of recently generated auction house data dumps.
     *
     * - Parameter realm: The realm being requested.
     */
    public func auctionDataStatus(realm realm: String) -> Observable<[WoW.AuctionDataStatus]> {
        return self.items(method: WoW.Method.AuctionDataStatus(realm: realm))
    }
    
    /**
     * Auction APIs currently provide rolling batches of data about current auctions. Fetching auction dumps is a two step process that involves checking a per-realm index file to determine if a recent dump has been generated and then fetching the most recently generated dump file if necessary.
     *
     * This API resource provides an auction house data dump.
     *
     * - Parameter status: The auction data status object retrieved via `auctionDataStatus(realm:)` API call.
     */
    public func auctionData(status status: WoW.AuctionDataStatus) -> Observable<WoW.AuctionData> {
        guard let url = NSURL(string: status.url) else {
            return Observable.error(Error.InvalidURL)
        }
        
        return self.networkProvider
            .query(request: NSURLRequest(URL: url))
            .map { WoW.AuctionData(json: $0) }
    }
    
    // MARK: - BOSS API
    
    /**
     * A list of all supported bosses. A 'boss' in this context should be considered a boss encounter, which may include more than one NPC.
     */
    public func bossMasterList() -> Observable<[WoW.Boss]> {
        return self.items(method: WoW.Method.BossMasterList)
    }
    
    /**
     * The boss API provides information about bosses. A 'boss' in this context should be considered a boss encounter, which may include more than one NPC.
     *
     * - Parameter id: The ID of the boss you want to retrieve.
     */
    public func boss(id id: Int) -> Observable<WoW.Boss> {
        return self.item(method: WoW.Method.Boss(id: id))
    }
    
    // MARK: - CHALLENGE MODE API
    
    /**
     * The data in this request has data for all 9 challenge mode maps (currently). The map field includes the current medal times for each dungeon. Inside each ladder we provide data about each character that was part of each run. The character data includes the current cached spec of the character while the member field includes the spec of the character during the challenge mode run.
     *
     * - Parameter realm: The realm being requested.
     */
    public func challenge(realm realm: String) -> Observable<[WoW.Challenge]> {
        return self.items(method: WoW.Method.Challenge(realm: realm))
    }
    
    /**
     * The region leaderboard has the exact same data format as the realm leaderboards except there is no realm field. It is simply the top 100 results gathered for each map for all of the available realm leaderboards in a region.
     */
    public func challenge() -> Observable<[WoW.Challenge]> {
        return self.items(method: WoW.Method.ChallengeRegion)
    }
    
    // MARK: - CHARACTER PROFILE API
    
    /**
     * The Character Profile API is the primary way to access character information. By default, a basic dataset will be returned and with each request and zero or more additional fields can be retrieved.
     *
     * - Parameter name: The name of the character you want to retrieve.
     * - Parameter realm: The character's realm. Can be provided as the proper realm name or the normalized realm name.
     * - Parameter fields: The dataset you wish to retrieve for the character. Each field value is explained in more detail in the `WoW.Character.Fields` enum documentation. If no fields are specified the API will only return basic data about the character.
     */
    public func characterProfile(name name: String, realm: String, fields: [WoW.Character.Fields]) -> Observable<WoW.Character> {
        return self.item(method: WoW.Method.Character(name: name, realm: realm, fields: fields))
    }
    
    // MARK: - GUILD PROFILE API
    
    // MARK: - ITEM API
    
    /**
     * The item API provides detailed item information. This includes item set information if this item is part of a set.
     *
     * - Parameter id: Unique ID of the item being requested.
     */
    public func item(id id: Int) -> Observable<WoW.Item> {
        return self.item(method: WoW.Method.Item(id: id))
    }
    
    /**
     * The item set API provides detailed item set information.
     *
     * - Parameter id: Unique ID of the set being requested.
     */
    public func itemSet(id id: Int) -> Observable<WoW.ItemSet> {
        return self.item(method: WoW.Method.ItemSet(id: id))
    }
    
    // MARK: - MOUNT API
    
    /**
     * A list of all supported mounts.
     */
    public func mountMasterList() -> Observable<[WoW.Mount]> {
        return self.items(method: WoW.Method.MountMasterList)
    }
    
    // MARK: - PET API
    
    /**
     * A list of all supported battle and vanity pets.
     */
    public func petMasterList() -> Observable<[WoW.Pet]> {
        return self.items(method: WoW.Method.PetMasterList)
    }
    
    /**
     * This provides data about a individual battle pet ability ID. We do not provide the tooltip for the ability yet. We are working on a better way to provide this since it depends on your pet's species, level and quality rolls.
     *
     * - Parameter id: The ID of the ability you want to retrieve.
     */
    public func petAbility(id id: Int) -> Observable<WoW.PetAbility> {
        return self.item(method: WoW.Method.PetAbility(id: id))
    }
    
    /**
     * This provides the data about an individual pet species. The species IDs can be found your character profile using the options pets field. Each species also has data about what it's 6 abilities are.
     *
     * - Parameter id: The species you want to retrieve data on.
     */
    public func petSpecies(id id: Int) -> Observable<WoW.PetSpecies> {
        return self.item(method: WoW.Method.PetSpecies(id: id))
    }
    
    /**
     * Retrieve detailed information about a given species of pet.
     *
     * - Parameter speciesId: The pet's species ID. This can be found by querying a users' list of pets via the Character Profile API.
     * - Parameter level: The pet's level. Pet levels max out at 25. If omitted the API assumes a default value of 1.
     * - Parameter breedId: The pet's breed. Retrievable via the Character Profile API. If omitted the API assumes a default value of 3.
     * - Parameter qualityId: The pet's quality. Retrievable via the Character Profile API. Pet quality can range from 0 to 5 (0 is poor quality and 5 is legendary). If omitted the API will assume a default value of 1.
     */
    public func petStats(speciesId speciesId: Int, level: Int?, breedId: Int?, qualityId: Int?) -> Observable<WoW.PetStats> {
        return self.item(method: WoW.Method.PetStats(speciesID: speciesId, level: level, breedId: breedId, qualityId: qualityId))
    }
    
    // MARK: - PVP API
    
    /**
     * The Leaderboard API endpoint provides leaderboard information for the `2v2`, `3v3`, `5v5` and `Rated Battleground` leaderboards.
     *
     * - Parameter bracket: The type of leaderboard you want to retrieve.
     */
    public func pvpLeaderboards(bracket bracket: WoW.PvpBracket) -> Observable<[WoW.PvpRanking]> {
        return self.items(method: WoW.Method.PvpLeaderboards(bracket: bracket))
    }
    
    // MARK: - QUEST API
    
    /**
     * Retrieve metadata for a given quest.
     *
     * - Parameter id: The ID of the desired quest.
     */
    public func quest(id id: Int) -> Observable<WoW.Quest> {
        return self.item(method: WoW.Method.Quest(id: id))
    }
    
    // MARK: - REALM STATUS API
    
    /**
     * The realm status API allows developers to retrieve realm status information. This information is limited to whether or not the realm is up, the type and state of the realm, the current population, and the status of the two world PvP zones.
     *
     * **PvP Area Status Fields**
     *
     * - `area` - An internal id of this zone.
     * - `controlling-faction` - Which faction is controlling the zone at the moment. Possible values are
     *   - `0`: Alliance
     *   - `1`: Horde
     *   - `2`: Neutral
     * - `status` - The current status of the zone. The possible values are
     *   - `-1`: Unknown
     *   - `0`: Idle
     *   - `1`: Populating
     *   - `2`: Active
     *   - `3`: Concluded
     * - `next` - A timestamp of when the next battle starts.
     */
    public func realmStatus() -> Observable<[WoW.Realm]> {
        return self.items(method: WoW.Method.RealmStatus)
    }
    
    // MARK: - RECIPE API
    
    /**
     * The recipe API provides basic recipe information.
     *
     * - Parameter id: Unique ID for the desired recipe.
     */
    public func recipe(id id: Int) -> Observable<WoW.Recipe> {
        return self.item(method: WoW.Method.Recipe(id: id))
    }
    
    // MARK: - SPELL API
    
    /**
     * The spell API provides some information about spells.
     *
     * - Parameter id: The ID of the spell you want to retrieve.
     */
    public func spell(id id: Int) -> Observable<WoW.Spell> {
        return self.item(method: WoW.Method.Spell(id: id))
    }
    
    // MARK: - ZONE API
    
    // MARK: - DATA RESOURCES
    
    /**
     * The battlegroups data API provides the list of battlegroups for this region.
     */
    public func battlegroups() -> Observable<[WoW.Battlegroup]> {
        return self.items(method: WoW.Method.Battlegroups)
    }
    
    /**
     * The character races data API provides a list of each race and their associated faction, name, unique ID, and skin.
     */
    public func characterRaces() -> Observable<[WoW.CharacterRace]> {
        return self.items(method: WoW.Method.CharacterRaces)
    }
    
    /**
     * The character classes data API provides a list of character classes.
     */
    public func characterClasses() -> Observable<[WoW.CharacterClass]> {
        return self.items(method: WoW.Method.CharacterClasses)
    }
    
    /**
     * The character achievements data API provides a list of all of the achievements that characters can earn as well as the category structure and hierarchy.
     */
    public func characterAchievements() -> Observable<[WoW.AchievementCategory]> {
        return self.items(method: WoW.Method.CharacterAchievements)
    }
    
    /**
     * The guild rewards data API provides a list of all guild rewards.
     */
    public func guildRewards() -> Observable<[WoW.GuildReward]> {
        return self.items(method: WoW.Method.GuildRewards)
    }
    
    /**
     * The guild perks data API provides a list of all guild perks.
     */
    public func guildPerks() -> Observable<[WoW.GuildPerk]> {
        return self.items(method: WoW.Method.GuildPerks)
    }
    
    /**
     * The guild achievements data API provides a list of all of the achievements that guilds can earn as well as the category structure and hierarchy.
     */
    public func guildAchievements() -> Observable<[WoW.AchievementCategory]> {
        return self.items(method: WoW.Method.GuildAchievements)
    }
    
    /**
     * The item classes data API provides a list of item classes
     */
    public func itemClasses() -> Observable<[WoW.ItemClass]> {
        return self.items(method: WoW.Method.ItemClasses)
    }
    
    /**
     * The different bat pet types (including what they are strong and weak against)
     */
    public func petTypes() -> Observable<[WoW.PetType]> {
        return self.items(method: WoW.Method.PetTypes)
    }
    
    // MARK: - Private methods
    
    private func item<T: Model>(method method: WoW.Method) -> Observable<T> {
        let request = WoW.RequestBuilder.request(method: method, region: self.region, locale: self.locale, apiKey: self.apiKey)
        return self.networkProvider
            .query(request: request)
            .map { T(json: $0) }
    }
    
    private func items<T: Model>(method method: WoW.Method) -> Observable<[T]> {
        guard let collectionKey = method.collectionKey() else {
            return Observable.error(Error.NotCollection)
        }

        let request = WoW.RequestBuilder.request(method: method, region: self.region, locale: self.locale, apiKey: self.apiKey)
        return self.networkProvider
            .query(request: request)
            .map { self.collection(json: $0, key: collectionKey) }
    }
    
    
    private func collection<T: Model>(json json: JSON, key: String) -> [T] {
        return json[key].map { T(json: $1) }
    }
    
}
