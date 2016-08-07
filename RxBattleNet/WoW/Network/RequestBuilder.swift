//
//  RequestBuilder.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 05/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import Foundation

private let ParamFields = "fields"

internal extension WoW {
    
    struct RequestBuilder {
        
        static func request(method method: WoW.Method, region: WoW.Region, locale: WoW.Locale, apiKey: String) -> NSURLRequest {
            let components = URLBuilder.components(path: method.path(), region: region, locale: locale, apiKey: apiKey)
            
            switch method {
            case .Character(_, _, let fields):
                let value = fields.reduce("") { $0.isEmpty ? $1.rawValue : $0 + ",\($1.rawValue)" }
                components.queryItems?.append(NSURLQueryItem(name: ParamFields, value: value))
                break
            default: break
            }
            
            return NSURLRequest(URL: components.URL!)
        }
        
    }
    
}
