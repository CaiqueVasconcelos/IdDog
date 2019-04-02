//
//  HomeWorker.swift
//  IdDog
//
//  Created by Caique on 29/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class HomeWorker: NSObject {
    func validateSignup(request: Home.validateSign.Request, _ completionHandler:@escaping(Home.validateSign.Response) -> Void) {
        let signRequest = SignupRequest(email: request.email ?? "")
        var signResponse = Home.validateSign.Response()
        Alamofire.request(signRequest.endpoint,
                          method: .post,
                          parameters: signRequest.body,
                          encoding: JSONEncoding.default,
                          headers: signRequest.headers).validate(contentType: ["application/json"]).responseJSON { response in
                            
//            if let result = response.result.value as? [String]{
//                completionHandler()
//            }else {
//                completionHandler()
//            }
//            if let responseHub = hubResponseSimple.value as? [String: Any] {
            if let resp = response.result.value as? [String: Any] {
                if let signMapper = Mapper<MapperSignup>().map(JSON: resp ) {
                    guard signMapper.errMessage == nil else {
                        signResponse.erro = signMapper.errMessage ?? "Ocorreu um erro"
                        completionHandler(signResponse)
                        return
                    }
                    
                    signResponse.response = signMapper
                    
                    Session.token = signResponse.response?.token ?? ""
                    completionHandler(signResponse)
                } else {
                    signResponse.erro = response.error?.localizedDescription ?? "Ocorreu um erro"
                    completionHandler(signResponse)
                }
            }
        }
    }
}
