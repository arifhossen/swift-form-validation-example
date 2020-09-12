//
//  ViewController.swift
//  swift-form-required-field-example
//
//  Created by MAC on 12/9/20.
//  Copyright © 2020 Arif Hossen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameOutlet: UITextField!
    
    @IBOutlet weak var lastNameOutlet: UITextField!
    
    @IBOutlet weak var emailOutlet: UITextField!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBOutlet weak var confirmPasswordOutlet: UITextField!
    
    @IBOutlet weak var submitBtnOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.submitBtnOutlet.layer.cornerRadius = 10
        
    }
    
    
    @IBAction func submitBtnTouchEvent(_ sender: Any) {
        
        guard let first_name = self.firstNameOutlet.text, !first_name.isEmpty else {
            showAlertDialog(title: "Required Field", message: "Please Enter First Name")
            return
        }
        
        guard let last_name = self.lastNameOutlet.text, !last_name.isEmpty else {
            showAlertDialog(title: "Required Field", message: "Please Enter Last Name")
            return
        }
        
        
        guard let email_address = self.emailOutlet.text, !email_address.isEmpty else {
            showAlertDialog(title: "Required Field", message: "Please Enter Email Address")
            return
        }
        
        
        if !email_address.isEmpty{
            
            if !checkEmailValidation(email: email_address) {
                showAlertDialog(title: "Required Field", message: "Please enter valid email address")
            }
        }
        
        
        
        guard let password = self.passwordOutlet.text, !password.isEmpty else {
            showAlertDialog(title: "Required Field", message: "Please Enter Password")
            return
        }
        
        guard let confirm_password = self.confirmPasswordOutlet.text, !confirm_password.isEmpty else {
            showAlertDialog(title: "Required Field", message: "Please Enter Confirm Password")
            return
        }
        
        
        
        if ((password.elementsEqual(confirm_password)) == false)
        {
          
            showAlertDialog(title: "Information", message: "Confirm password not matched with your password")
            return
        }
        else{
            print("password matched")
        }
        
    }
    
    
    func checkEmailValidation(email: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: email, options: [], range: NSRange(location: 0, length: email.count)) != nil
    }
    
    
    func showAlertDialog(title:String,message:String)
    {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion:  nil)
    }
    
    
}

