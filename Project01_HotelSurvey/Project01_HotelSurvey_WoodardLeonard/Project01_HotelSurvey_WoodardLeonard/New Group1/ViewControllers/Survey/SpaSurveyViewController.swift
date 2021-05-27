//
//  SpaSurveyViewController.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/30/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

open class SpaSurveyViewController: UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSubmitSurvey(_ sender: UIButton) {
          let getBD = UIStoryboard(name: "Services", bundle: nil)
          let list = getBD.instantiateViewController(withIdentifier: "ServiceList") as! SurveyListViewController
              self.present(list, animated: true, completion: nil)    }
}
