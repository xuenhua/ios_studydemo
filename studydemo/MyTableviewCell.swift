//
//  MyTableview.swift
//  studydemo
//
//  Created by Xu Enhua on 2018/10/20.
//  Copyright © 2018年 XuEnhua. All rights reserved.
//

import UIKit

class MyTableviewCell: UITableViewCell {

    @IBOutlet weak var ImageBackGround: UIImageView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    var favstate = false {
        willSet {
            if newValue == true {
            favBtn.setImage(UIImage(named:"contactflag_star_mark"), for: .normal)
            }
            if newValue == false {
                //favBtn.setImage(UIImage(named:"AlbumLikeSmall_Golden"), for: .normal)
                favBtn.setImage(#imageLiteral(resourceName: "AlbumLikeSmall_Golden"), for: .normal)
                
            }
        }
    }
    
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var country: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
