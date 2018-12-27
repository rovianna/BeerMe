//
//  Beer.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation
import SwiftyJSON

class Beer {
    var id: String
    var name: String
    var alcoholContent: String
    var imageUrl: String
    var tagline: String
    var bitternessScale: String
    var description: String
    
    init(id: String, name: String, alcoholContent: String, imageUrl: String, tagline: String, bitternessScale: String, description: String) {
        self.id = id
        self.name = name
        self.alcoholContent = alcoholContent
        self.imageUrl = imageUrl
        self.tagline = tagline
        self.bitternessScale = bitternessScale
        self.description = description
    }
    
    init(withJSON json: JSON) {
        id = json["id"].stringValue
        name = json["name"].stringValue
        alcoholContent = json["abv"].stringValue
        imageUrl = json["image_url"].stringValue
        tagline = json["tagline"].stringValue
        bitternessScale = json["ibu"].stringValue
        description = json["description"].stringValue
    }
}
