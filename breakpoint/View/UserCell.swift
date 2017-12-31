//
//  UserCell.swift
//  breakpoint
//
//  Created by Gutpinter Norbert on 2017. 12. 27..
//  Copyright © 2017. Gut Norbert. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool){
        self.profileImage.image = image
        self.emailLbl.text = email
        if isSelected{
            self.checkImage.isHidden = false
        } else {
            self.checkImage.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected{
            if checkImage.isHidden {
                checkImage.isHidden = false
            } else {
                checkImage.isHidden = true
            }
        }
    }

}
