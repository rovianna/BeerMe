//
//  Beer.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation
import SwiftyJSON

class Beer: NSObject, NSCoding {
    var id: String
    var name: String
    var alcoholContent: String
    var imageUrl: String
    var tagline: String
    var bitternessScale: String
    var beerDescription: String
    
    init(id: String, name: String, alcoholContent: String, imageUrl: String, tagline: String, bitternessScale: String, beerDescription: String) {
        self.id = id
        self.name = name
        self.alcoholContent = alcoholContent
        self.imageUrl = imageUrl
        self.tagline = tagline
        self.bitternessScale = bitternessScale
        self.beerDescription = beerDescription
    }
    
    init(withJSON json: JSON) {
        id = json["id"].stringValue
        name = json["name"].stringValue
        alcoholContent = json["abv"].stringValue
        imageUrl = json["image_url"].stringValue
        tagline = json["tagline"].stringValue
        bitternessScale = json["ibu"].stringValue
        beerDescription = json["description"].stringValue
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as! String
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let alcoholContent = aDecoder.decodeObject(forKey: "abv") as! String
        let imageUrl = aDecoder.decodeObject(forKey: "image") as! String
        let tagline = aDecoder.decodeObject(forKey: "tagline") as! String
        let bitternessScale = aDecoder.decodeObject(forKey: "ibu") as! String
        let beerDescription = aDecoder.decodeObject(forKey: "beerDescription") as! String
        
        self.init(id: id, name: name, alcoholContent: alcoholContent, imageUrl: imageUrl, tagline: tagline, bitternessScale: bitternessScale, beerDescription: beerDescription)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(alcoholContent, forKey: "abv")
        aCoder.encode(imageUrl, forKey: "image")
        aCoder.encode(tagline, forKey: "tagline")
        aCoder.encode(bitternessScale, forKey: "ibu")
        aCoder.encode(beerDescription, forKey: "beerDescription")
    }
    
}
