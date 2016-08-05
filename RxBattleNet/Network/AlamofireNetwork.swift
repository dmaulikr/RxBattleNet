//
//  AlamofireNetwork.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 05/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import SwiftyJSON

internal class AlamofireNetwork: RxNetwork {
    
    func query(request request: NSURLRequest) -> Observable<JSON> {
        return Observable.create { observer in
            
            let handle = Alamofire
                .request(request)
                .responseJSON { response in
                    if let value = response.result.value {
                        observer.onNext(JSON(value))
                        observer.onCompleted()
                    } else if let error = response.result.error {
                        observer.onError(error)
                    }
                }
            
            return AnonymousDisposable {
                handle.cancel()
            }
        }
    }
    
}
