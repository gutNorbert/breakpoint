//
//  FeedCell.swift
//  breakpoint
//
//  Created by Gutpinter Norbert on 2017. 12. 27..
//  Copyright © 2017. Gut Norbert. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, content: String){
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }

}
