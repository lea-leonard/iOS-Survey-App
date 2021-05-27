//
//  SignUpViewController.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/29/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

open class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtPin: UITextField!
    @IBOutlet weak var txtPinVerify: UITextField!
    @IBOutlet weak var lblErrorMsg: UILabel!
    @IBOutlet weak var btnSign_Up: UIButton!
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // set defaults for text fields and buttons
        lblErrorMsg.text = ""
        btnSign_Up.isEnabled = false
        btnSign_Up.backgroundColor = .none
    }
      
    @IBAction func verifyId(_ sender: UITextField) {
        // editDidEnd
        if txtId.text == ""{
            lblErrorMsg.text = "Must enter an User Id of your choice"
            txtId.isSelected = true
            btnSign_Up.backgroundColor = .none
            
        } else {
            lblErrorMsg.text = ""
            txtPin.isSelected = true
        }
    }
    
    @IBAction func verifyPin(_ sender: UITextField) {
        // editDidEnd
        if txtPin.text == "" || txtPin.text?.count != 4 {
                lblErrorMsg.text = "Must enter a pin with length of 4"
                txtPin.isSelected = true
                btnSign_Up.isEnabled = false
                btnSign_Up.backgroundColor = .none
            
        } else {
            lblErrorMsg.text = ""
        }
    }
    
    @IBAction func verifyPInMatch(_ sender: UITextField) {
        // editDidEnd
        if !((txtPinVerify.text?.elementsEqual(txtPin.text!))!){
            lblErrorMsg.text = "Your pins do not match. Please re-enter pin"
            txtPinVerify.isSelected = true
            btnSign_Up.isEnabled = false
            btnSign_Up.backgroundColor = .none
            
        } else {
            lblErrorMsg.text = ""
            btnSign_Up.isEnabled = true
            btnSign_Up.backgroundColor = .black
        }
    }
    
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        // add value from textfield in CoreData Model
       
        // save data to class dictionary
        let dicUsers = ["id": txtId.text, "pin": txtPinVerify.text] as! [String : String]
        
        // initialize the CoreData Helper class
        let reply = LoginDataHelper.dh.addData(object: dicUsers )
        print("Sign up reply= \(reply)")
        print(dicUsers)
        lblErrorMsg.text = reply
        
        //go back to Sign in
        let getSB = UIStoryboard(name: "Main", bundle: nil)
        let loginView = getSB.instantiateViewController(withIdentifier: "Login") as! LogInViewController
        self.present(loginView, animated: true, completion: nil)
        
    }// end btnSignUp
    
    
    @IBAction func btnCancel(_ sender: UIButton) {
        // user cancels sign up
        let getSB = UIStoryboard(name: "Main", bundle: nil)
        
        let loginView = getSB.instantiateViewController(withIdentifier: "Login") as! LogInViewController
        
        self.present(loginView, animated: true, completion: nil)
        
    }// end btnCancel
}// end class
