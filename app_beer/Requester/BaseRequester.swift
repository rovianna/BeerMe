//
//  BaseRequester.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias callback = ((ResponseWrapper<Any>)->Void)

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

struct ResponseWrapper<T> {
    var result: Result<T>
}

class BeerRequesterData {
    static let shared = BeerRequesterData()
    
    var enviroment: String {
        return "https://api.punkapi.com/v2"
    }
}

class BaseRequester {
    static let shared = BaseRequester()
    
    func baseRequester(path: String, httpMethod: HTTPMethod, completion: @escaping callback) {
        if let pathRequest = URL(string: "\(BeerRequesterData.shared.enviroment)/\(path)") {
            Alamofire.request(pathRequest, method: httpMethod, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                switch response.result {
                    case .failure(let error):
                    let wrapper = ResponseWrapper<Any>(result: Result.failure(error))
                    completion(wrapper)
                    case .success(let data):
                    let wrapper = ResponseWrapper<Any>(result: Result.success(data))
                    completion(wrapper)
                }
            }
        }
    }
}
