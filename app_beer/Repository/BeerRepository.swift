//
//  BeerRepository.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

fileprivate let userDefaults = UserDefaults.standard

protocol BeerRepository {
    func getAllBeers(completion: @escaping(Result<[Beer]>)->Void)
}

class LocalBeerRepository: BeerRepository {
    func getAllBeers(completion: @escaping (Result<[Beer]>) -> Void) {
        var beersList = [Beer]()
        let decodedData = userDefaults.object(forKey: "beers") as! Data
        do {
            if let loadedBeers = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decodedData) as? [Beer] {
                beersList = loadedBeers
                completion(Result.success(beersList))
            }
        } catch {
            completion(Result.failure(error))
        }
    }
}

class RemoteBeerRepository: BeerRepository {
    func getAllBeers(completion: @escaping (Result<[Beer]>) -> Void) {
        let beerRequester = BeerRequester()
        beerRequester.getBeersList { (result) in
            switch result {
                case .success(let data):
                completion(Result.success(data))
                case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
}
