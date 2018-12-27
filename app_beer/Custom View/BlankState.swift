//
//  BlankState.swift
//  app_beer
//
//  Created by Rodrigo Vianna on 27/12/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class BlankState: UIView {
    class var instance: BlankState {
        let nib = UINib(nibName: "BlankState", bundle: nil).instantiate(withOwner: nil, options: nil)
        let view = nib.first as! BlankState
        return view
    }
    
    typealias BlankStateAction = (UIButton)->Void
    
    @IBOutlet weak var errorImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var errorButton: UIButton!
    
    var action: BlankStateAction? = nil
    
    @IBAction func didTapAction(_ sender: UIButton) {
        action?(sender)
    }
}
