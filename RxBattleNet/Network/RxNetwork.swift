//
//  RxNetwork.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 05/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

public protocol RxNetwork: class {
    func query(request request: NSURLRequest) -> Observable<JSON>
}
