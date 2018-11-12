//
//  TableViewController.swift
//  studydemo
//
//  Created by Xu Enhua on 2018/10/20.
//  Copyright © 2018年 XuEnhua. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    var pictures = [MyPicture]()
    var btnrowid = 0
    var clickName = ""
    
    @IBAction func ShowDetailBtnTap(_ sender: UIButton) {
        clickName = "ShowDetailBtnTap"
        let btnpos = sender.convert(CGPoint.zero, to: self.tableView)
        print("坐标",btnpos)
        let indexPath=tableView.indexPathForRow(at: btnpos)
        btnrowid=indexPath!.row
        print("=====",btnrowid)
        //self.performSegue(withIdentifier: "detailview2", sender: Any?.self)
        
    }
    @IBAction func favBtnTap(_ sender: UIButton) {
        clickName = "favBtnTap"
        let btnpos = sender.convert(CGPoint.zero, to: self.tableView)
        print("坐标",btnpos)
        
        let indexPath=tableView.indexPathForRow(at: btnpos)
        print("行",indexPath!)
        pictures[indexPath!.row].favstate = !pictures[indexPath!.row].favstate
        
        let cell=tableView.cellForRow(at: indexPath!) as! MyTableviewCell
        cell.favstate = pictures[indexPath!.row].favstate
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //设置标题颜色，页面设置有bug，代码中处理
navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "MyColor")]
        
        //设置小标题颜色
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "MyColor")]
        //加载数据源
        let mydata = MyDataSet()
        pictures=getPicturesArray2(dataset: mydata)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
//和左右滑动互斥
   /* override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let rowid = indexPath.row
        name.remove(at: rowid)
        type.remove(at: rowid)
        country.remove(at: rowid)
        imagename.remove(at: rowid)
        favstateArray.remove(at: rowid)
        print(name.count,type.count,favstateArray.count)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        print("已经删除第",rowid,"行")
        
    }*/
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "删除"){(_,_,complete) in
            let rowid = indexPath.row
            self.pictures.remove(at: rowid)
//            self.name.remove(at: rowid)
//            self.type.remove(at: rowid)
//            self.country.remove(at: rowid)
//            self.imagename.remove(at: rowid)
//            self.favstateArray.remove(at: rowid)
            print("还剩余",self.pictures.count,"条！")
            tableView.deleteRows(at: [indexPath], with: .automatic)
            print("已经删除第",rowid,"行")
            complete(true)
        }
        let shareAction = UIContextualAction(style: .normal, title: "分享"){_,_,complete2 in
            let txt="分享:\(self.pictures[indexPath.row].country)的\(self.pictures[indexPath.row].type)\(self.pictures[indexPath.row].imageName)"
            let image = UIImage(named: self.pictures[indexPath.row].imageName)
            let act = UIActivityViewController(activityItems: [txt,image!], applicationActivities: nil)
            //ipad
            let pad_act = act.popoverPresentationController
            if let cell = tableView.cellForRow(at: indexPath){//可选绑定，先判断是否有值，如果有值赋值给变量cell，否则不赋值
                pad_act?.sourceView=cell
                pad_act?.sourceRect=cell.bounds
            }
            //ipad上面的方法和这个相同
            //act.popoverPresentationController?.sourceView=tableView.cellForRow(at: indexPath)
            //act.popoverPresentationController?.sourceRect=(tableView.cellForRow(at: indexPath)?.bounds)!
            
            
            self.present(act, animated: true)
            complete2(true)
            
            
        }
        
        shareAction.backgroundColor = .orange
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
        return  config
        
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var mtitle = "收藏"
        if self.pictures[indexPath.row].favstate{
            mtitle="取消收藏"
        }
        
        let favAction = UIContextualAction(style: .normal, title: mtitle) { (_, _,complete) in
            self.pictures[indexPath.row].favstate = !self.pictures[indexPath.row].favstate
            let cell=tableView.cellForRow(at: indexPath) as! MyTableviewCell
            cell.favstate = self.pictures[indexPath.row].favstate
            complete(true)
        }
        favAction.backgroundColor = UIColor.gray
        favAction.image=#imageLiteral(resourceName: "contactflag_star_mark")
        if self.pictures[indexPath.row].favstate{
            favAction.image=#imageLiteral(resourceName: "AlbumLikeSmall_Golden")
        }
        let config = UISwipeActionsConfiguration(actions: [favAction])
        return  config
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.pictures.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cellid=String(describing:MyTableviewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! MyTableviewCell
        let rowid=indexPath.row
        cell.type.text=pictures[rowid].type
        cell.name.text=pictures[rowid].name
        cell.country.text=pictures[rowid].country
        cell.ImageBackGround.image=UIImage(named: pictures[rowid].imageName)
        cell.favstate = pictures[rowid].favstate
        
        
//        cell.type.text=type[indexPath.row]
//        cell.name.text=name[indexPath.row]
//        cell.country.text=country[indexPath.row]
//        cell.ImageBackGround.image=UIImage(named: imagename[indexPath.row])
//        cell.favstate = favstateArray[indexPath.row]

        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //判断跳转
        print(segue.identifier)
        print(clickName)
        print(btnrowid)
        if segue.identifier == "detailview2"{
            //设置目的地
            let destination2 = segue.destination as! MyTableViewControllerForDetail
            //传递参数
            //destination2.imageName = pictures[btnrowid].imageName //imagename[rowid]
            destination2.mypicture = pictures[btnrowid]
        }else if segue.identifier == "backHome"{
            
        }else {
            // Get the new view controller using segue.destination.
            //选择的行号
            let rowid = tableView.indexPathForSelectedRow!.row
            //设置目的地
            let destination = segue.destination as! MyCellDetailViewController
            
            // Pass the selected object to the new view controller.
            //传递参数
            destination.imageName = pictures[rowid].imageName //imagename[rowid]
        }
        
        
        
    }
    

}
