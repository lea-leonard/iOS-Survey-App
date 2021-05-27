//
//  WelComeViewController.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/30/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

class WelComeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnStart(_ sender: UIButton) {
        
        let getBD = UIStoryboard(name: "Services", bundle: nil)
        
        let services = getBD.instantiateViewController(withIdentifier: "ServiceList") as! SurveyListViewController
        
        self.present(services, animated: true, completion: nil)
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
