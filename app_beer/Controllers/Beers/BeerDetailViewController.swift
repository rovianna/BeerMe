//
//  BeerDetailViewController.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {
    class var instance: BeerDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "detail") as! BeerDetailViewController
        return vc
    }
    
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerTaglineLabel: UILabel!
    @IBOutlet weak var beerABVLabel: UILabel!
    @IBOutlet weak var beerIBULabel: UILabel!
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(beer != nil, "Must have a beer!")
        configure(beer: beer)
    }
    
    func configure(beer: Beer) {
        beerImageView.downloadImage(from: beer.imageUrl)
        beerNameLabel.text = beer.name
        beerTaglineLabel.text = beer.tagline
        beerABVLabel.text = "Teor alcoólico: \(beer.alcoholContent)"
        beerIBULabel.text = "Escala de amargor: \(beer.bitternessScale)"
        beerDescriptionLabel.text = beer.beerDescription
    }
    
    @IBAction func closeDetailAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
