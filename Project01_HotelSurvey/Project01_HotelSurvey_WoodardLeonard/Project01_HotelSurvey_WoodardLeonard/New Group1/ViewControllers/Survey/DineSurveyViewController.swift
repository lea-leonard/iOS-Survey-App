//
//  DineSurveyViewController.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/30/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

open class DineSurveyViewController: UIViewController {
    

    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var btnTest: UIButton!
    
    override open func viewDidLoad() {
            super.viewDidLoad()
            
    }
    
    
    @IBAction func btnSubmit(_ sender: UIButton) {
        sender.backgroundColor = .yellow
       
       let getBD = UIStoryboard(name: "Services", bundle: nil)
       let list = getBD.instantiateViewController(withIdentifier: "ServiceList") as! SurveyListViewController
       self.present(list, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
