//
//  ViewController.swift
//  CountryCodePicker
//
//  Created by Mangesh Lad on 13/01/16.
//  Copyright © 2016 CliniFact. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var countryCodePicker: CountryCodePicker!

    @IBOutlet weak var countryCodeTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryCodePicker = CountryCodePicker(forTextField: countryCodeTextField)
        countryCodeTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func resign() {
        countryCodeTextField.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if (textField == countryCodeTextField) {
            resign()
            let initValue = countryCodeTextField.text
            countryCodePicker!.pick(self, initValue: initValue, dataChanged: { (newValue : String, forTextField : UITextField) -> () in
                self.countryCodeTextField.text = newValue
            })
            return false
        } else {
            return true
        }
    }
}

