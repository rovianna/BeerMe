//
//  BeerTableViewCell.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerABVLabel: UILabel!
    
    override func awakeFromNib() {
        selectionStyle = .none
    }
    
    func configure(beer: Beer) {
        beerImageView.loadImage(for: beer)
        beerNameLabel.text = beer.name
        beerABVLabel.text = "Teor alcoólico: \(beer.alcoholContent)"
    }
    
}
