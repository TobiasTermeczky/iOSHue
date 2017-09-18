//
//  LocationTableViewCell.swift
//  iOs-Hue
//
//  Created by Tobias Termeczky@hotmail.com on 18/09/2017.
//  Copyright © 2017 Tobias Termeczky@hotmail.com. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblLocationName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
