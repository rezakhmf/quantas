//
//  AirportsTableViewCell.swift
//  Qantas
//
//  Created by Reza Farahani on 19/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import UIKit

class AirportsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var airportNameCode: UILabel!
    @IBOutlet weak var airportTimeZone: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
}
