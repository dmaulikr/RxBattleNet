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
    private let networkProvider: RxNetwork
    
    // MARK: - Init
    
    public init(apiKey: String) {
        self.init(apiKey: apiKey, networkProvider: AlamofireNetwork())
    }
    
    internal init(apiKey: String, networkProvider: RxNetwork) {
        self.apiKey = apiKey
        self.networkProvider = networkProvider
    }
    
    // MARK: - Public methods
    
    public func bossMasterList(region region: WoW.Region, locale: WoW.Locale) -> Observable<[WoW.Boss]> {
        return self.items(method: WoW.Method.BossMasterList, region: region, locale: locale)
    }
    
    public func boss(id id: Int, region: WoW.Region, locale: WoW.Locale) -> Observable<WoW.Boss> {
        return self.item(method: WoW.Method.Boss(id: id), region: region, locale: locale)
    }
    
    public func realmStatus(region region: WoW.Region, locale: WoW.Locale) -> Observable<[WoW.Realm]> {
        return self.items(method: WoW.Method.RealmStatus, region: region, locale: locale)
    }
    
    // MARK: - Private methods
    
    private func item<T: Model>(method method: WoW.Method, region: WoW.Region, locale: WoW.Locale) -> Observable<T> {
        let request = WoW.RequestBuilder.request(method: method, region: region, locale: locale, apiKey: self.apiKey)
        return self.networkProvider
            .query(request: request)
            .map { T(json: $0) }
    }
    
    private func items<T: Model>(method method: WoW.Method, region: WoW.Region, locale: WoW.Locale) -> Observable<[T]> {
        guard let collectionKey = method.collectionKey() else {
            return Observable.error(Error.NotCollection)
        }

        let request = WoW.RequestBuilder.request(method: method, region: region, locale: locale, apiKey: self.apiKey)
        return self.networkProvider
            .query(request: request)
            .map { self.collection(json: $0, key: collectionKey) }
    }
    
    
    private func collection<T: Model>(json json: JSON, key: String) -> [T] {
        return json[key].map { T(json: $1) }
    }
    
}
