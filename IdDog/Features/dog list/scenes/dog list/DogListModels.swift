//
//  DogListModels.swift
//  IdDog
//
//  Created by Caique on 31/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

class DogList {
    enum dogs {
        struct Request {
            var token: String?
            var category: String?
        }
        struct Response {
            var erro: String?
            var response: Dog?
        }
        struct ViewModel {
            var dog: Dog?
            var dogs: [Dog] = []
        }
    }
}
