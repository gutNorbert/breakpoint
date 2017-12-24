//
//  ShadowView.swift
//  breakpoint
//
//  Created by Gutpinter Norbert on 2017. 12. 24..
//  Copyright © 2017. Gut Norbert. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    
    func setupView(){
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }

}
