//
//  HueTableViewCell.swift
//  iOs-Hue
//
//  Created by Tobias Termeczky@hotmail.com on 18/09/2017.
//  Copyright © 2017 Tobias Termeczky@hotmail.com. All rights reserved.
//

import UIKit

class HueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var switchHueId: UISwitch!
    @IBOutlet weak var lblHueId: UILabel!
    var baseUrl: String = ""
    var token: String = ""
    var HueId: String = ""
    
    @IBAction func stateBtnClicked(_ sender: Any) {
        if switchHueId.isOn{
            let hue = Hue()
            hue.turnOn(url: "\(baseUrl)\(token)/lights/\(HueId)/state/")
        } else {
            let hue = Hue()
            hue.turnOff(url: "\(baseUrl)\(token)/lights/\(HueId)/state/")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
