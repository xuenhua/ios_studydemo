//
//  MyTableViewCellDetail.swift
//  studydemo
//
//  Created by Xu Enhua on 2018/10/21.
//  Copyright © 2018年 XuEnhua. All rights reserved.
//

import UIKit

class MyTableViewCellDetail: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
