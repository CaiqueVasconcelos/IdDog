//
//  DogListWorker.swift
//  IdDog
//
//  Created by Caique on 31/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class DogListWorker: NSObject {
    func listDogs(request: DogList.dogs.Request, _ completionHandler:@escaping(DogList.dogs.Response) -> Void) {
        let dogRequest = DogRequest(authorization: request.token ?? "", category: request.category ?? "")
        var dogResponse = DogList.dogs.Response()
        Alamofire.request(dogRequest.endpoint,
                          method: .get,
                          parameters: dogRequest.body,
                          encoding: JSONEncoding.default,
                          headers: dogRequest.headers).validate(contentType: ["application/json"]).responseJSON { response in
            
            if let resp = response.result.value as? [String: Any] {
                if let dogMapper = Mapper<MapperDog>().map(JSON: resp ) {
                    guard dogMapper.errMessage == nil else {
                        dogResponse.erro = dogMapper.errMessage ?? "Ocorreu um erro"
                        completionHandler(dogResponse)
                        return
                    }
                    dogResponse.response = dogMapper.dog
                    completionHandler(dogResponse)
                } else {
                    dogResponse.erro = response.error?.localizedDescription ?? "Ocorreu um erro"
                    completionHandler(dogResponse)
                }
            }
            
        }
    }

}
