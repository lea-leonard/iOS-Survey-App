//
//  LogInViewController.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/29/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var viewSignup: UIView!
    enum views : String {
        case Signin = "signin"
        case Signup = "signup"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getView(v:String){
        // get a value for which Login UIView to show
        // from enum datatype: views
        if v == views.Signin.rawValue{
            viewSignup.isHidden = true
            viewLogin.isHidden = false
        } else if v == views.Signup.rawValue {
            viewSignup.isHidden = false
            viewLogin.isHidden = true
        } else {
            // show default view Signin
            viewSignup.isHidden = true
            viewLogin.isHidden = false
        }
    }// end getView
    

    @IBAction func toggleLoginViews(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            viewSignup.isHidden = false
            viewLogin.isHidden = true
        case 1:
            viewSignup.isHidden = true
            viewLogin.isHidden = false
        default:
            viewSignup.isHidden = true
            viewLogin.isHidden = false
        }// end switch
    }


}
