//
//  LoadingView.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    class var instance: LoadingView {
        let nib = UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: nil, options: nil)
        let view = nib.first as! LoadingView
        return view
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
    }
    
    func startAnimating() {
        if let superV = superview {
            super.translatesAutoresizingMaskIntoConstraints = false
            self.centerXAnchor.constraint(equalTo: superV.centerXAnchor).isActive = true
            self.centerYAnchor.constraint(equalTo: superV.centerYAnchor).isActive = true
            self.heightAnchor.constraint(equalToConstant: 100).isActive = true
            self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        }
        activityIndicator.startAnimating()
    }
    
    func stopAnimating() {
        self.isHidden = true
        activityIndicator.stopAnimating()
    }
    
}
