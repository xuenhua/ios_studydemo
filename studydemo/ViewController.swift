//
//  ViewController.swift
//  studydemo
//
//  Created by Xu Enhua on 2018/10/20.
//  Copyright © 2018年 XuEnhua. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var students=["朋友圈","闹钟","图片","阅读"]
    var imagename=["Action_Moments","Action_Remind","Action_SaveAsPicture","Action_WeRead"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "mytableCell",for:indexPath)
        cell.textLabel?.text=students[indexPath.row]
        //cell.ImageBackGround.image=UIImage(named: imagename[indexPath.row])
        cell.imageView?.image=UIImage(named: imagename[indexPath.row])
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

