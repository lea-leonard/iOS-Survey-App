//
//  ForgotPinViewController.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/24/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

class ForgotPinViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPin: UITextField!
    @IBOutlet weak var txtPinVerify: UITextField!
    @IBOutlet weak var lblErrorMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblErrorMsg.text = ""

    }
    
    
    @IBAction func btnSave(_ sender: UIButton) {
        
        
    }// end btnSave
    
    @IBAction func btnCancel(_ sender: UIButton) {
        
        // go back to view.Login
        let currentView = UIStoryboard(name: "Main", bundle: nil)
        
        let loginView = currentView.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        
        self.present(loginView, animated: true, completion: nil)
        
    }
    
    
}
