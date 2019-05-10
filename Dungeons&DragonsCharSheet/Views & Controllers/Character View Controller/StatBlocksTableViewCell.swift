//
//  StatBlocksTableViewCell.swift
//  Dungeons&DragonsCharSheet
//
//  Created by Liam Flaherty on 5/10/19.
//  Copyright © 2019 Liam Flaherty. All rights reserved.
//

import UIKit

class StatBlocksTableViewCell: UITableViewCell {

    @IBOutlet weak var StatName: UILabel!
    @IBOutlet weak var flatNum: UILabel!
    @IBOutlet weak var BonusNum: UILabel!
    @IBOutlet weak var SaveNum: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
