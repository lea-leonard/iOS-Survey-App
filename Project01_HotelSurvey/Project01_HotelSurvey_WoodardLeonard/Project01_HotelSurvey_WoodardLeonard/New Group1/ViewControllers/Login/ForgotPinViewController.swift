//
//  ForgotPinViewController.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/29/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

open class ForgotPinViewController: UIViewController {

    
   
    @IBOutlet weak var txtPin: UITextField!
    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtPinVerify: UITextField!
    @IBOutlet weak var lblErrorMsg: UILabel!
    @IBOutlet weak var buttonSave: UIButton!
    
    // instances to verify textfield values
    var userData = [String:String]()
    var currentID:String?
    var currentPin:String?
    var countVerifyId: Int = 0
    
       
    override open func viewDidLoad() {
           super.viewDidLoad()
           
        lblErrorMsg.text = ""
        txtPinVerify.backgroundColor = .none
                        
        // get data from core data to update data
        getCoreData()
 }
     
    func getCoreData(){
      let data = LoginDataHelper.dh.getData()
      // add do/try/catch statement
      for d in data{
          userData.updateValue(d.pin ?? "no data", forKey: d.id ?? "no data")
      }// end for loop
    }// end getCoreData
    
   func goToView(view:String){
        let getSB = UIStoryboard(name: "Main", bundle: nil)
        let loginView = getSB.instantiateViewController(withIdentifier: "Login") as! LogInViewController
        self.present(loginView, animated: true, completion:{loginView.getView(v:view)})
        
    }
    //  when user id txtfield end editing checking if user id exists
    @IBAction func userIdExists(_ sender: UITextField) {
        // if user tried 3 times to input correct user id
        if countVerifyId == 3{
                        
             goToView(view:"signup")
        }
        // check user id is in core data
        let id:String = txtId.text!
        var valid:Bool = false
        for(k,v) in userData{
            if k == id{
                valid = true
                lblErrorMsg.text = "User id exists. Enter new pin"
                currentID = id
                txtPinVerify.isEnabled = false
            }
        }
        if !valid{
            if countVerifyId == 3{
                lblErrorMsg.text = "Please Sign Up for a User Id"
                
            } else {
                lblErrorMsg.text = "User id does not exists. You have \(3 - countVerifyId) more chances"
                // increment number of tries by 1
                countVerifyId = countVerifyId + 1
            }
        }
                
    }// end userIdExists
    
    
    @IBAction func if_emptyId(_ sender: UITextField) {
        //before pin is edit
        if txtId.text == ""{
            lblErrorMsg.text = "Must enter a User id"
        }
    }// end userIdExists
    
    

    @IBAction func verifyPIn(_ sender: UITextField) {
     // editDidEnd
        txtPinVerify.isEnabled = true
        lblErrorMsg.text = ""
        if txtId.text == ""{
            lblErrorMsg.text = "Must enter you User ID first"
        } else if txtPin.text == "" || txtPin.text?.count != 4 {
           lblErrorMsg.text = "Must enter a pin with length of 4"
           txtPinVerify.isSelected = true
        } else {
           lblErrorMsg.text = ""
            txtPinVerify.backgroundColor = .white
            txtPinVerify.isSelected = true
       }
        txtPinVerify.isEnabled = true
    }// end userIdExists}
    
    @IBAction func verifyPinMatch(_ sender: UITextField) {
        // editDidEnd
        lblErrorMsg.text = ""
    
        if !((txtPinVerify.text?.elementsEqual(txtPin.text!))!){
            lblErrorMsg.text = "Your pins do not match. Please re-enter pin(s)"
            txtPinVerify.isSelected = true
                                   
        } else {
            let pin:String = txtPinVerify.text!
            currentPin = pin
            lblErrorMsg.text = ""
                       
        }// end userIdExists
    }
    
    @IBAction func btnSave(_ sender: UIButton) {
        
        if txtId.text == "" || txtPin.text == "" ||  txtPinVerify.text == ""{
            lblErrorMsg.text = "Please fill all fields"
        }else if currentID == "" || currentPin == ""{
             lblErrorMsg.text = "Please fill all fields"
        } else {
            LoginDataHelper.dh.deleteData(ID: currentID!)
            let user = ["id":txtId.text, "pin":txtPinVerify.text]
            let reply = LoginDataHelper.dh.addData(object: user as! [String : String])
            lblErrorMsg.text = "\(reply)"
             goToView(view: "signin")
       }
    }// end btnSave
       
   @IBAction func btnCancel(_ sender: UIButton) {
       
       // go back to view.Login
       goToView(view:"signin")
   }

}

