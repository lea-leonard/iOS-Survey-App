//
//  RoomTableViewCell.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/29/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

open class RoomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblRoom: UILabel!    
        
    override open func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            // Configure the view for the selected state
       
        
    }
        
 
    
    
}
