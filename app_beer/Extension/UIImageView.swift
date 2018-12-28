//
//  UIImageView.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    func downloadImage(from url: String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, task, error) in
            if error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
        }
        task.resume()
    }
    
    func loadImage(for beer: Beer) {
        sd_setImage(with: URL(string: beer.imageUrl), placeholderImage: UIImage(named: "loading.png"), options: .continueInBackground) { (image, error, cache, url) in
            guard error == nil else { return }
        }
    }
    
}

