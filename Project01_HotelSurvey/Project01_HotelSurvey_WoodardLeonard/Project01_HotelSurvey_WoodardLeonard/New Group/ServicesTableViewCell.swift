//
//  ServicesTableViewCell.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/25/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

class ServicesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblCell01: UILabel!
    @IBOutlet weak var lblCell02: UILabel!
    @IBOutlet weak var lblCell03: UILabel!
    @IBOutlet weak var lblCell04: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
