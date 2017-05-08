//
//  StudentCell.swift
//  Student_Management
//
//  Created by TTB on 5/8/17.
//  Copyright © 2017 TTB. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {
    
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var university: UILabel!
    @IBOutlet weak var descript: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
