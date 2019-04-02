//
//  HomeModels.swift
//  IdDog
//
//  Created by Caique on 29/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

enum Home {
    enum validateSign {
        struct Request {
            var email: String?
        }
        
        struct Response {
            var erro: String?
            var response: MapperSignup?
        }
        
        struct ViewModel {
            var response: MapperSignup?
        }
    }
}
