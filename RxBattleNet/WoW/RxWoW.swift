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
    
    public init(apiKey: String, region: WoW.Region, locale: WoW.Locale) {
        self.init(apiKey: apiKey, region: region, locale: locale, networkProvider: AlamofireNetwork())
    }
    
    internal init(apiKey: String, region: WoW.Region, locale: WoW.Locale, networkProvider: RxNetwork) {
        self.apiKey = apiKey
        self.region = region
        self.locale = locale
        self.networkProvider = networkProvider
    }
    
    // MARK: - Public methods
    
    public func bossMasterList() -> Observable<[WoW.Boss]> {
        return self.items(method: WoW.Method.BossMasterList)
    }
    
    public func boss(id id: Int) -> Observable<WoW.Boss> {
        return self.item(method: WoW.Method.Boss(id: id))
    }
    
    public func characterProfile(name name: String, realm: String, fields: [WoW.Character.Fields]) -> Observable<WoW.Character> {
        return self.item(method: WoW.Method.Character(name: name, realm: realm, fields: fields))
    }
    
    public func realmStatus() -> Observable<[WoW.Realm]> {
        return self.items(method: WoW.Method.RealmStatus)
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
