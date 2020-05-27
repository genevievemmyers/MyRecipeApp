//
//  newRecipeViewController.swift
//  myersG_Final
//
//  Created by Genevieve Myers on 3/10/20.
//  Copyright © 2020 Genevieve Myers. All rights reserved.
//

import UIKit

class newRecipeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Measure.allCases.count
    }
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
    forComponent component: Int)
    -> String? {
        return Measure.allCases[row].rawValue
    }
    
    
    var firstItem : Bool = true
    var newRecIng : [(String, Double, Measure)] = []
    
    var rec = ""
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var ingText: UITextField!
    @IBOutlet weak var quantityText: UITextField!
    @IBOutlet weak var measure: UIPickerView!
    @IBOutlet weak var ingList: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //segwayBut.isEnabled = false
        // Do any additional setup after loading the view.
        self.title = "New Recipe"
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        ingText.resignFirstResponder()
        quantityText.resignFirstResponder()
        titleText.resignFirstResponder()
    }
    
    @IBAction func add(_ sender: UIButton) {
        //segwayBut.isEnabled = true
        titleText.resignFirstResponder()
        ingText.resignFirstResponder()
        quantityText.resignFirstResponder()
        var message: String = ""
        if firstItem == true && titleText.text != ""{
            rec = titleText.text!
            self.title = rec
            titleText.isHidden = true
            firstItem = false
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
        if firstItem == true && titleText.text == "" {
            message = "Please provide a name for your recipe"
        }
        if quantityText.text != "" && ingText.text != "" {
            if let val = Double(quantityText.text!) {
                measure.selectedRow(inComponent: 0)
                let newIng = (ingText.text!, val, Measure.allCases[measure.selectedRow(inComponent: 0)])
                newRecIng += [newIng]
                quantityText.text = ""
                ingText.text = ""
                measure.selectRow(0, inComponent: 0, animated: true)
                navigationItem.rightBarButtonItem?.isEnabled = true

                
            }
            else if message == "" {
                message = "Pease enter a valid quantity of the form 0.0"
            }
        }
        else if message == "" {
            message = "Please be sure to enter a string for your ingridient, \n and a quantity of the form 0.0"
        }
        if message != "" {
            let alertController =
                UIAlertController(title: "Oups! Invalid Input",
                                  message: message,
                                  preferredStyle: .alert)
            
            let cancelAction =
                UIAlertAction(title: "OK",
                              style: .cancel,
                              handler: nil)
            alertController.addAction(cancelAction)
            present(alertController,
                    animated: true,
                    completion: nil)
        }
        else {
            var str = ""
            for lst in newRecIng {
                str += String(lst.1)+" "+lst.2.rawValue+" of "+lst.0+"\n"
            }
            ingList.numberOfLines = 0;
            ingList.lineBreakMode = .byWordWrapping;
            ingList.text = str
        }
    }
    
    @IBAction func undo(_ sender: UIButton) {
        if firstItem != true {
            newRecIng.removeLast()
            var str = ""
            for lst in newRecIng {
                str += String(lst.1)+" "+lst.2.rawValue+" of "+lst.0+"\n"
            }
            ingList.numberOfLines = 0;
            ingList.lineBreakMode = .byWordWrapping;
            ingList.text = str
            if newRecIng.count == 0 {
                navigationItem.rightBarButtonItem?.isEnabled = false
            }
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if let detailViewController = segue.destination as? instructionsViewController {
            detailViewController.ingLst = newRecIng
            detailViewController.name = rec
        }
        // Pass the selected object to the new view controller.
    }
    

}
