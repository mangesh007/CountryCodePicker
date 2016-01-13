//
//  CFCountryCodePicker.swift
//  CliniFact
//
//  Created by Mangesh Lad on 06/03/15.
//  Copyright (c) 2015 CliniFact. All rights reserved.
//

import UIKit

public class CountryCodePicker : NSObject, UIPopoverPresentationControllerDelegate, CountryCodePickerViewControllerDelegate {
    
    public typealias CountryCodePickerCallback = (value : String, forTextField : UITextField)->()
    
    var ccPickerVC : CountryCodeViewController = CountryCodeViewController()
    var popover : UIPopoverPresentationController?
    var textField : UITextField!
    var dataChanged : CountryCodePickerCallback?
    var presented = false
    var offset : CGFloat = 8.0
    
    public init(forTextField: UITextField) {
        super.init()
        self.textField = forTextField
        
    }
    
    public func pick(inViewController : UIViewController, initValue : String?, dataChanged : CountryCodePickerCallback) {
        
        if presented {
            return  // we are busy
        }
        
        ccPickerVC.delegate = self
        ccPickerVC.modalPresentationStyle = UIModalPresentationStyle.Popover
        ccPickerVC.preferredContentSize = CGSizeMake(450, 208)//(500,208)
        ccPickerVC.currentCountryCode = initValue
        
        popover = ccPickerVC.popoverPresentationController
        if let _popover = popover {
            
            _popover.sourceView = textField
            _popover.sourceRect = CGRectMake(self.offset,textField.bounds.size.height,0,0)
            _popover.delegate = self
            self.dataChanged = dataChanged
            inViewController.presentViewController(ccPickerVC, animated: true, completion: nil)
            presented = true
        }
    }
    
    public func adaptivePresentationStyleForPresentationController(PC: UIPresentationController) -> UIModalPresentationStyle {
        
        return .None
    }
    
    func countryCodePickerVCDismissed(value : String?) {
        
        if let _dataChanged = dataChanged {
            
            if let _data = value {
                
                _dataChanged(value: _data, forTextField: textField)
                
            }
        }
        presented = false
    }
}