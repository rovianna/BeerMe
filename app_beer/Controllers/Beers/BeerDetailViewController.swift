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
    
    var beer: Beer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(beer != nil, "Must have a beer!")
    }
    
    @IBAction func closeDetailAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
