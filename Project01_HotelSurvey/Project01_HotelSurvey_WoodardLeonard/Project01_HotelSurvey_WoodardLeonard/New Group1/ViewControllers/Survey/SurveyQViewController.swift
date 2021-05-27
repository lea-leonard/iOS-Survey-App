//
//  SurveyQViewController.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 5/1/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

open class SurveyQViewController: UIViewController {
    
    static var thisClass = SurveyQViewController()
    
    @IBOutlet weak var lblSurveyTitle: UILabel!
    @IBOutlet weak var lblDisplayQuestion: UILabel!
    @IBOutlet weak var lblPoints: UILabel!
    @IBOutlet weak var Happy: UIButton!
    @IBOutlet weak var Ok: UIButton!
    
    @IBOutlet weak var Poor: UIButton!
    @IBOutlet weak var imgOverall: UIImageView!
    
    var currentSurvey:String!
    let s = SurveyQuestions.inst
    var list = [String]()
    var count = 0 // displayQuestions()
    var totalPoints = 0
    
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        lblPoints.isHidden = true
        
    }
    
    //  get data from file:SurveyQuestions
    func setSurvey(){
       s.setCurrentSurvey(survey: currentSurvey)
       getQuestions()
   }
    
    func getQuestions(){
        
        switch currentSurvey{
        case "Rooms":
            list = list + s.lstRoomsQ
        case "Dine":
            list = list + s.lstDineQ
        case "Spa":
            list = list + s.lstSpaQ
        case "Gym":
            list = list + s.lstGymQ
        default:
            print("end getQuestions")
        }
        //print(list)
        displayQuestions()
    }
    
    func displayQuestions(){
        // use var:count to retrieve index from list
        // if count is 5; question ended go back to
        // Service list
        if count == 5 {
            totalPoints = s.getPoints()
            s.resetPoints()
            lblDisplayQuestion.isHidden = true
            Happy.isEnabled = false
            Ok.isEnabled = false
            Poor.isEnabled = false
            getOverallImg()
            Timer.scheduledTimer(timeInterval:3.0, target: self, selector: #selector(updateData), userInfo: nil, repeats: true)
           
        } else {
            // show question to view
            lblDisplayQuestion.text = list[count]
        }// end if/else
    }
    
    func getOverallImg(){
       
        if totalPoints >= 85{
            self.imgOverall.image = UIImage(named: "happyFaceRed")
        } else if totalPoints < 85 && totalPoints >= 50{
            self.imgOverall.image = UIImage(named: "okFace")
        } else if totalPoints < 50 {
            self.imgOverall.image = UIImage(named: "poorFaceBlue")
        }
        totalPoints = 0 // reset points
        s.resetPoints()
        
    }
    
    @IBAction func btnHappy(_ sender: UIButton) {
        lblPoints.isHidden = false
        s.calculatePts(index: 0)
        lblPoints.text = String(s.getPoints())
        count = count + 1
        displayQuestions()
    }
    
    @IBAction func btnOk(_ sender: UIButton) {
        lblPoints.isHidden = false
        s.calculatePts(index: 1)
        lblPoints.text = String(s.getPoints())
        count = count + 1
        displayQuestions()
    }
    
    @IBAction func btnPoor(_ sender: UIButton) {
        lblPoints.isHidden = false
        s.calculatePts(index: 2)
        lblPoints.text = String(s.getPoints())
        count = count + 1
        displayQuestions()
    }
    
  
    @objc func updateData(){
        viewServiceList()
    }
    
    func viewServiceList(){
        let getBD = UIStoryboard(name: "Services", bundle: nil)
        let list = getBD.instantiateViewController(withIdentifier: "ServiceList") as! SurveyListViewController
        self.present(list, animated: true, completion: nil)
    }
    
}// end class
