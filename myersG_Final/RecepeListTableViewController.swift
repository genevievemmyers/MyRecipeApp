//
//  RecepeListTableViewController.swift
//  myersG_Final
//
//  Created by Genevieve Myers on 3/8/20.
//  Copyright © 2020 Genevieve Myers. All rights reserved.
//

import UIKit

class RecepeListTableViewController: UITableViewController {
  
    
    override func viewDidLoad() {
        super.tableView.reloadData()
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        /*let singleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(RecepeListTableViewController.handleSingleTap))
        singleTapRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTapRecognizer)
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(RecepeListTableViewController.handleDoubleTap))
        doubleTapRecognizer.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTapRecognizer)
        singleTapRecognizer.require(toFail: doubleTapRecognizer)
    }
    
    @objc
    func handleSingleTap(_ sender: UITapGestureRecognizer) {
        //var controller = recipeTableViewController()
        
        single = true
        
    }
    @objc
    func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        //var controller = EditViewController()
        single = false
    }*/
    

    // MARK: - Table view data source
    //var edited = 0
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basic", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = recipes[indexPath.row].name
        cell.textLabel?.isUserInteractionEnabled = true
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.labelSwipedLeft(sender:)))
        cell.textLabel?.addGestureRecognizer(swipeLeft)
        cell.textLabel?.tag = indexPath.row
        return cell
    }
    @objc func labelSwipedLeft(sender: UITapGestureRecognizer) {
        let alertController = UIAlertController(title: "Delete this recipe?",
                            message: "Would you like to delete \(recipes[sender.view!.tag].name)?",
                            preferredStyle: .actionSheet)
      let deleteAction =
      UIAlertAction(title: "Delete",
                    style: .destructive) {action in
                        recipes.remove(at: sender.view!.tag)
                        super.tableView.reloadData()
        }
      let cancelAction =
          UIAlertAction(title: "Cancel",
                        style: .cancel,
                        handler: nil)
        alertController.addAction(deleteAction)
      alertController.addAction(cancelAction)
      present(alertController,
              animated: true,
              completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailViewController = segue.destination as? recipeTableViewController {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                detailViewController.recipe = recipes[indexPath.row]
           }
        }}
      
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


