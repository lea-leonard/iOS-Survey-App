//
//  DineTableViewCell.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/29/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

open class DineTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblDine: UILabel!
    var cell:DineTableViewCell!
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
    }
    
}
