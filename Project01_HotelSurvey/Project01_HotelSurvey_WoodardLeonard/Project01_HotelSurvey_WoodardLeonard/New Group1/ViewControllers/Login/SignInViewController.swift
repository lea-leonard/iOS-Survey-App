//
//  SignInViewController.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/29/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

open class SignInViewController: UIViewController {
    
   
    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var txtPin: UITextField!
    @IBOutlet weak var lblErrorMsg: UILabel!
    @IBOutlet weak var switchRemember: UISwitch!
    @IBOutlet weak var btnSign_In: UIButton!
    
    // instances to verify textfield values
    let ud = UserDefaults.standard
    var udID:String = ""
    var udPin:String = ""
    var userId: String!
    var userPin: String!
    var userData = [String:String]()
    
       
    override open func viewDidLoad() {
        super.viewDidLoad()
        lblErrorMsg.text = ""
        switchRemember.setOn(false, animated: true)
        btnSign_In.tintColor = .black
        
        // get data from CoreData
        getCoreData()
        // for testing data in core data
        print("Data in dictionary")
        for (k,v) in userData{
            print("Id = \(k), Pin = \(v)")
        }
   }
    
    func getCoreData(){
        let data = LoginDataHelper.dh.getData()
        // add do/try/catch statement
        for d in data{
            userData[d.id ?? "no data"] = d.pin ?? "no data"
            //userData.updateValue(d.pin ?? "no data", forKey: d.id ?? "no data")
        }// end for loop
        print("Number of records \(userData.count)")
        if userData.isEmpty{
            print("no data")
        }
    }// end getCoreData
    
    func searchLoginData() -> Bool {
        // func to see if an user id already exits
        for (k,v) in userData{
            if txtUserId.text! == k{
                userId = k
                userPin = v
                return true
            }
        }
        return false
    }// end searchLoginData
    
/* _____________________________________________________________*/
    
    
    @IBAction func toggleRemeber(_ sender: UISwitch) {
        // verify text fields are not empty
        if sender.isOn{
            if txtUserId.text != "" && txtPin.text != ""{
                udID = txtUserId.text!
                ud.set(txtPin.text, forKey: "udID")
            }
        }
     
    }// end toggleRemember
      
    @IBAction func setUserId(_ sender: UITextField) {
        var doesExist = false
        lblErrorMsg.text = ""
        if txtUserId.text == ""{
            lblErrorMsg.text = "Please enter you User id"
        } else {
            lblErrorMsg.text = ""
            userId = txtUserId.text
            // search Core data to see if User id already exist
            doesExist = searchLoginData()
            if doesExist == false{
                lblErrorMsg.text = "User id does not exists"
            }
            if switchRemember.isOn{
                txtPin.text = ud.string(forKey:"udID")
            }
        }
    }// end setUserId
          
    @IBAction func verifyPin(_ sender: UITextField) {
        //after edit verify pin not empty and exist in core data
        
        lblErrorMsg.text = ""
        if txtPin.text == ""{
            lblErrorMsg.text = "Please enter a 4 digit Pin"
        }else if txtPin.text!.count != 4{
            lblErrorMsg.text = "Please enter a 4 digit Pin"
        } else {
            lblErrorMsg.text = ""
            //check id/pin validation in core data
            if txtPin.text != userPin{
                lblErrorMsg.text = "Invalid Pin for User ID"
                txtPin.isHighlighted = true
            }
            lblErrorMsg.text = ""
 
        }// en outer if/else
    }
    
    @IBAction func btnSignIn(_ sender: UIButton) {
        lblErrorMsg.text = ""
        //verify that id & pin are valid in core data
        if txtUserId.text == "" || txtPin.text == "" {
            lblErrorMsg.text = "Please fill all fields"
        }else {
            for (k,v) in userData{
                if userData[k] == txtPin.text{
                    lblErrorMsg.text = "Data Found"
                    // go to welcome page
                    let currentView = UIStoryboard(name:"Main", bundle: nil)
                    let welcomeView = currentView.instantiateViewController(withIdentifier: "Welcome") as! WelComeViewController
                    self.present(welcomeView, animated: true, completion: nil)
                } else if userData[k] != txtPin.text {
                    lblErrorMsg.text = "User ID and Pin do not match."
                } else {
                    lblErrorMsg.text = ""
                }
            }
                
                btnSign_In.isEnabled = true
        }

    }// end btnSignIn

    @IBAction func btnForgotPin(_ sender: UIButton) {
        // check to see if user id is available in Core Data
            // go to fogotPin view pass user id if exists in core data
            let getBD = UIStoryboard(name: "Main", bundle: nil)
            let forgot = getBD.instantiateViewController(withIdentifier: "ForgotPin") as! ForgotPinViewController
            self.present(forgot, animated: true, completion:nil)
            
    }// end btnForgotPin

}// end class
