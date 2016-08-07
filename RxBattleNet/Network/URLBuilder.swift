//
//  URLBuilder.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import Foundation

private let Scheme = "https"

private let ParamLocale = "locale"
private let ParamApiKey = "apikey"

internal struct URLBuilder {
    
    static func components(path path: String, region: WoW.Region, locale: WoW.Locale, apiKey: String) -> NSURLComponents {
        let components = NSURLComponents()
        components.scheme = Scheme
        components.host = region.rawValue
        components.path = path
        components.queryItems = [
            NSURLQueryItem(name: ParamLocale, value: locale.rawValue),
            NSURLQueryItem(name: ParamApiKey, value: apiKey)
        ]
        
        return components
    }
    
}
