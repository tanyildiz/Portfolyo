//
//  SampleTableViewCell.swift
//  Portfolyo
//
//  Created by Niyazi TANYILDIZ on 29/05/2017.
//  Copyright © 2017 nt. All rights reserved.
//

import UIKit

class SampleTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var workName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
