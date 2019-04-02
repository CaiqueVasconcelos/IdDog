//
//  MapperDog.swift
//  IdDog
//
//  Created by Caique on 31/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit
import ObjectMapper

struct Dog {
    var category: String?
    var urlList: [String]?
    var imageList: [UIImage]?
}

class MapperDog: Mappable {
    var dog: Dog?
    var category: String?
    var list: [String]?
    
    private var error: [String: Any]?
    var errMessage: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        error <- map["error"]
        if error != nil {
            errMessage = error!["message"] as! String
        }
        category <- map["category"]
        list <- map["list"]
        dog = Dog(category: category, urlList: list, imageList: nil)
        
    }
}
