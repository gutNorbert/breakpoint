//
//  GroupCell.swift
//  breakpoint
//
//  Created by Gutpinter Norbert on 2017. 12. 31..
//  Copyright © 2017. Gut Norbert. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    //Outlets
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescriptionlbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitleLbl.text = title
        self.groupDescriptionlbl.text = description
        self.memberCountLbl.text = "\(memberCount) members."
    }
}
