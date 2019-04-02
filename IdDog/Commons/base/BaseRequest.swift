//
//  BaseRequest.swift
//  IdDog
//
//  Created by Caique on 29/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

class BaseRequest {
    var endpoint: String = ""
    var headers: [String: String] = [:]
    var body: [String : Any] = [:]
    
    required init() {}
}
