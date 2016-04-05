//
//  CustomHeaderCell.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 11/03/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import UIKit

class CustomHeaderCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!

    @IBOutlet weak var nameSp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
