//
//  MyCellDetailViewController.swift
//  studydemo
//
//  Created by Xu Enhua on 2018/10/21.
//  Copyright © 2018年 XuEnhua. All rights reserved.
//

import UIKit

class MyCellDetailViewController: UIViewController {

    var imageName = "" 
    @IBOutlet weak var detailImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("detailImageView",imageName)
        detailImageView.image = UIImage(named: imageName)
        //不使用父级的大标题
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
