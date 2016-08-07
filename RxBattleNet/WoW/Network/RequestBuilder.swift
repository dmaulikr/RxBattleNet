//
//  RequestBuilder.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 05/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import Foundation

private struct Params {
    static let fields = "fields"
    static let level = "level"
    static let breedId = "breedId"
    static let qualityId = "qualityId"
}

internal extension WoW {
    
    struct RequestBuilder {
        
        static func request(method method: WoW.Method, region: WoW.Region, locale: WoW.Locale, apiKey: String) -> NSURLRequest {
            let components = URLBuilder.components(path: method.path(), region: region, locale: locale, apiKey: apiKey)
            
            switch method {
            case .Character(_, _, let fields):
                let value = fields.reduce("") { $0.isEmpty ? $1.rawValue : $0 + ",\($1.rawValue)" }
                components.queryItems?.append(NSURLQueryItem(name: Params.fields, value: value))
                break
            case .PetStats(_, let level, let breedId, let qualityId):
                if let level = level {
                    components.queryItems?.append(NSURLQueryItem(name: Params.level, value: String(level)))
                }
                if let breedId = breedId {
                    components.queryItems?.append(NSURLQueryItem(name: Params.breedId, value: String(breedId)))
                }
                if let qualityId = qualityId {
                    components.queryItems?.append(NSURLQueryItem(name: Params.qualityId, value: String(qualityId)))
                }
            default: break
            }
            
            return NSURLRequest(URL: components.URL!)
        }
        
    }
    
}
