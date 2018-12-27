//
//  BeerRequester.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation
import SwiftyJSON

class BeerRequester {
    func getBeersList(completion: @escaping (Result<[Beer]>)-> Void) {
        let path = "beers"
        BaseRequester.shared.baseRequester(path: path, httpMethod: .get) { (response) in
            switch response.result {
                case .success(let data):
                    let beers = JSON(data).arrayValue.compactMap { Beer.init(withJSON: $0) }
                    DispatchQueue.main.async {
                        completion(Result.success(beers))
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(Result.failure(error))
                    }
            }
        }
    }
}