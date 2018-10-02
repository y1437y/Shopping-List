//
//  AddShoppingListView.swift
//  Shopping List
//
//  Created by Hayden Kaci on 9/29/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

class AddShoppingListView: UIViewController {

    @IBOutlet weak var Website: UITextField!
    @IBOutlet weak var URL: UITextField!
    @IBOutlet weak var Item: UITextField!
    @IBOutlet weak var Begin: UITextField!
    @IBOutlet weak var End: UITextField!
    
    let DatePicker = UIDatePicker()
    var activeTextfield : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DatePickerSetup()
    }
    
    @IBAction func SaveShoppingList(_ sender: UIButton) {
        guard let website = Website.text,
              let url = URL.text,
              let item = Item.text,
              let begin = Begin.text,
              let end = End.text
        else {
            return
        }
        
        if website == "" || url == "" || item == "" || begin == "" || end == "" {
            let alert = UIAlertController(title: "Woops!!!", message: "You left something empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            print("nothing is empty.")
        }
    }
    
    func DatePickerSetup() {
        DatePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton, spaceButton, cancelButton], animated: false)
        
        Begin.inputAccessoryView = toolbar
        Begin.inputView = DatePicker
        End.inputAccessoryView = toolbar
        End.inputView = DatePicker
    }
    
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM/dd/yyyy"
        if activeTextfield == Begin {
            Begin.text = formatter.string(from: DatePicker.date)
        } else {
            End.text = formatter.string(from: DatePicker.date)
        }
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
}

extension AddShoppingListView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextfield = textField
    }
}
