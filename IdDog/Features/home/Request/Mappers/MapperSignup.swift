//
//  MapperSignup.swift
//  IdDog
//
//  Created by Caique on 29/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit
import ObjectMapper

class MapperSignup: Mappable {
    private var user: [String: Any]?
    var token: String?
    private var error: [String: Any]?
    var errMessage: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        user <- map["user"]
        if user != nil {
            token = user!["token"] as! String
            print(token)
        }
        error <- map["error"]
        if error != nil {
            errMessage = error!["message"] as! String
        }
//        token <- user["token"]
    }
}
