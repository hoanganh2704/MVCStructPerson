//
//  TableViewController.swift
//  MVC
//
//  Created by hoanganh on 4/23/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var  student2:[Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        student2 = DataService.conpho.student
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // gán giá trị bên dataservice cho thằng student2 vì ở trên đang khai báo nó là 1 mảng rỗng
        student2 = DataService.conpho.student
        tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return student2.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
         let student1 = student2[indexPath.row]
        cell.nameLabel.text = student1.name
        cell.ageLabel.text = student1.age
        cell.sexLabel.text = student1.sex
        cell.avatar.image = student1.photo

        // Configure the cell...

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination as! ViewController
        if let index = tableView.indexPathForSelectedRow{
            VC.student3 = student2[index.row]
            VC.indexPath = index
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            DataService.conpho.remove(indexPath: indexPath)
        }
        student2 = DataService.conpho.student
        tableView.reloadData()
        }    
    }


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


