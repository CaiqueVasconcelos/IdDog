//
//  ImageUtils.swift
//  IdDog
//
//  Created by Caique on 29/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import AlamofireImage

//var imageCache = NSCache<AnyObject, UIImage>()
let imageCache = AutoPurgingImageCache()

class ImageUtils: NSObject {
    
    static func downloadImage(url: URL, callback: @escaping(Data?) -> Void) {
        Alamofire.request(url).responseImage { response in
            debugPrint(response)
    
            debugPrint(response.result)
    
            if let image = response.result.value {
                print("image downloaded: \(image)")
            }
        }
    }
    
    static func loadImage(url: String, callback: @escaping(UIImage?) -> Void) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        if let image = imageCache.image(for: urlRequest) {
                callback(image)
            } else {
            downloadImage(url: URL(string: url)!) { (response) in
                    guard response != nil, let image = UIImage(data: response!) else {
                            callback(nil)
                            return
                    }
                    imageCache.add(image, for: urlRequest)
                    return callback(image)
                }
            }
        }
    
//    static func downloadImage(url: URL, callback: @escaping(Data?, String?) -> Void) {
//        Alamofire.request(url.absoluteString, parameters: nil, headers: nil).responseJSON { response in
//            if let result = response.data{
//                callback(result, nil)
//            }else {
//                callback(nil, response.result.error.debugDescription)
//            }
//        }
//    }
//    static func loadImage(url: URL, callback: @escaping(UIImage?, String?) -> Void) {
//        if let image = imageCache.object(forKey: url.absoluteString as AnyObject) {
//            callback(image, nil)
//        } else {
//            downloadImage(url: url) { (data, error) in
//                guard error == nil,
//                    let image = UIImage(data: data!) else {
//                        callback(nil, "Erro ao carregar a imagem")
//                        return
//                }
//                imageCache.setObject(image, forKey: url.absoluteString as AnyObject)
//                return callback(image, nil)
//            }
//        }
//
//    }
}
