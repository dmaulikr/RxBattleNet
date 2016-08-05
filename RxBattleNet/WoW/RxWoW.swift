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

private let KeyApiKey = "RxBattleNetApiKey"
private let KeyNetworkProvider = "RxBattleNetNetworkProvider"

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
    
    public func query(method method: WoW.Method, region: WoW.Region, locale: WoW.Locale) -> Observable<JSON> {
        let request = WoW.RequestBuilder.request(method: method, region: region, locale: locale, apiKey: self.apiKey)
        return self.networkProvider.query(request: request)
    }
    
}
