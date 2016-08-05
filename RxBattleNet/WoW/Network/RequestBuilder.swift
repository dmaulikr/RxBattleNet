//
//  RequestBuilder.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 05/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import Foundation

private let Scheme = "https"

private let ParamLocale = "locale"
private let ParamApiKey = "apikey"

internal extension WoW {
    
    struct RequestBuilder {
        
        static func request(method method: WoW.Method, region: WoW.Region, locale: WoW.Locale, apiKey: String) -> NSURLRequest {
            let components = NSURLComponents()
            components.scheme = Scheme
            components.host = region.rawValue
            components.path = method.rawValue
            
            var queryItems = [NSURLQueryItem]()
            
            switch method {
            case .RealmStatus: break
            }
            
            queryItems += [
                NSURLQueryItem(name: ParamLocale, value: locale.rawValue),
                NSURLQueryItem(name: ParamApiKey, value: apiKey)
            ]
            
            components.queryItems = queryItems
            
            return NSURLRequest(URL: components.URL!)
        }
        
    }
    
}
