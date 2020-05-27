//
//  instructionsViewController.swift
//  myersG_Final
//
//  Created by Genevieve Myers on 3/10/20.
//  Copyright © 2020 Genevieve Myers. All rights reserved.
//

import UIKit

class instructionsViewController: UIViewController {
    var ingLst : [(String, Double, Measure)]?
    var name : String?
    var instLst : [String] = []
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var undo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        undo.isEnabled = false
        if (name != nil) {
            self.title = name!
        }
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var output: UILabel!
    
    @IBAction func savePressed(_ sender: UIButton) {
        undo.isEnabled = true
        if input.text == "" {
            input.resignFirstResponder()
            let alertController =
                UIAlertController(title: "Oups! Invalid Input", message:"Please enter an instruction", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
        else {
            instLst += [input.text!]
            var str = ""
            for (i,lst) in instLst.enumerated() {
                let val = i+1
                str += String(val)+". "+lst+"\n"
            }
            output.numberOfLines = 0;
            output.lineBreakMode = .byWordWrapping;
            output.text = str
            input.text = ""
        }
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        input.resignFirstResponder()
    }
    @IBAction func undoPressed(_ sender: UIButton) {
        if instLst.count > 0 {
            input.resignFirstResponder()
            instLst.removeLast()
            var str = ""
            for (i,lst) in instLst.enumerated() {
                let val = i+1
                str += String(val)+". "+lst+"\n"
            }
            output.numberOfLines = 0;
            output.lineBreakMode = .byWordWrapping;
            output.text = str
        }
    }
    
    @IBAction func done(_ sender: UIButton) {
        let new = Recipe(name: name!, ingredients: ingLst!, instructions: instLst)
        recipes.append(new)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let detailViewController = segue.destination as? RecepeListTableViewController {
            detailViewController.tableView.reloadData()
    }?
    

}*/
}
