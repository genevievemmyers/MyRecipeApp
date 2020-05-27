//
//  recipeTableViewController.swift
//  myersG_Final
//
//  Created by Genevieve Myers on 3/9/20.
//  Copyright © 2020 Genevieve Myers. All rights reserved.
//

import UIKit

class recipeTableViewController: UITableViewController {
    
    var recipe : Recipe?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Scale", style: .plain, target: self, action: #selector(addTapped))
    }
    @objc func addTapped(sender: UIBarButtonItem) {
       self.performSegue(withIdentifier: "scaleSeg", sender: self);
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var num = 0
        if section == 0 {
            num = recipe!.ingredients.count
        }
        if section == 1 {
            num = recipe!.instructions.count
        }
        return num
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableIngred", for: indexPath)
        cell.textLabel?.numberOfLines = 0;
        cell.textLabel?.lineBreakMode = .byWordWrapping;
        if indexPath.section == 0 {
            if let val = recipe?.ingredients[indexPath.row] {
                let str = String(val.1)+" "+val.2.rawValue+" of "+val.0
                cell.textLabel?.text = str
            }
        }
        if indexPath.section == 1 {
            let row = indexPath.row + 1
            cell.textLabel?.text = String(row)+". "+recipe!.instructions[indexPath.row]
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String {
        var str = ""
        if section == 0 {
            str = "Ingredients"
        }
        if section == 1 {
            str = "Instructions"
        }
        return str
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 20, y: 8, width: 320, height: 20)
        myLabel.font = UIFont.boldSystemFont(ofSize: 19)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)

        let headerView = UIView()
        headerView.addSubview(myLabel)

        return headerView
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailViewController = segue.destination as? ScaleTableViewController {
            detailViewController.recipe = recipe!.ingredients
            detailViewController.name = recipe!.name
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        if let r = recipe {
            self.title = r.name
        }
    }
        

}
