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
