//
//  MyTableViewControllerForDetail.swift
//  studydemo
//
//  Created by Xu Enhua on 2018/10/21.
//  Copyright © 2018年 XuEnhua. All rights reserved.
//

import UIKit

class MyTableViewControllerForDetail: UITableViewController {
    var imageName = ""
    var mypicture : MyPicture!
    var headerView : UIView!
    
    @IBOutlet weak var detailImageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //导航栏隐藏背景
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage=UIImage()
        navigationController?.navigationBar.tintColor=UIColor(named: "MyColor")
        
        detailImageView2.image = UIImage(named: mypicture.imageName)
        
        
        print("detailImageView2",mypicture.imageName)
        //不使用父级的大标题
       navigationItem.largeTitleDisplayMode = .never
        
        headerView=tableView.tableHeaderView!
        tableView.tableHeaderView=nil
        tableView.addSubview(headerView)
        tableView.contentInset=UIEdgeInsets(top: 300, left: 0, bottom: 0, right: 0)
        
        
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
    //数据几个字段
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    //单元格数据
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cellid = String(describing: MyTableViewCellDetail.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: "mytableDetailCell2", for: indexPath) as! MyTableViewCellDetail
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Name"
            cell.valueLabel.text = mypicture.name
        case 1:
            cell.keyLabel.text = "Type"
            cell.valueLabel.text = mypicture.type
        case 2:
            cell.keyLabel.text = "Image"
            cell.valueLabel.text = mypicture.imageName
        case 3:
            cell.keyLabel.text = "Country"
            cell.valueLabel.text = mypicture.country
        case 4:
            cell.keyLabel.text = "Favourate"
            cell.valueLabel.text = mypicture.favstate.description
        default:
            cell.keyLabel.isHidden=true
            cell.valueLabel.text = mypicture.text
        }
        
        return cell
    }
 //滚动动态调整图片效果
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("滚动位移值：",scrollView.contentOffset.y)
        let offset=scrollView.contentOffset.y
        print(-offset)
       
        headerView.frame = CGRect(x: 0, y: offset, width: tableView.bounds.width, height: -offset)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var ratingButton: UIButton!
    @IBAction func backDetail(segue:UIStoryboardSegue){
        if let rating = segue.identifier{
            mypicture.rating = rating
            ratingButton.setTitle("打分：\(rating)分", for: .normal)
            
        }
    }

}
