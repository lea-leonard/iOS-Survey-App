//
//  SurveyQuestions.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 5/1/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import Foundation
import UIKit

open class SurveyQuestions{
    
    static var inst = SurveyQuestions()
    
    var current:String!
    let lstRoomsQ = ["Was the room comfortable?", "Everyday you stayed, did you get room service for cleaning and restocking?", "Did the entertainment system work well?", "At nights, were the halls quiet?", "Were the rooms bigger enough for you party?"]
    
    
    let lstDineQ = ["Was the dining area comfortable?", "Were you able to find a sit in our restaurant?", "Was your server helpful?", "When ordering in, was it delivered on time?", "How awesome was our food selection?"]
    
    let lstSpaQ = ["Did you find our spa easily?", "Was our spas and pools clean?", "Did you feel safe at our pools?", "Were our towels available?", "What is your overall evperience?"]
    let lstGymQ = ["Did you find our gym easily?", "Was a machine available?", "Was the gym clean?", "Were our attendents helpful?", "How was our wifi connection?"]
    //let lstRateImg = ["faceHappy", "faceOk", "facePoor"]
    var points:Int
       
    init() {
        points = 0
    }

    func setCurrentSurvey(survey:String){
        current = survey
    }
    
    func calculatePts(index:Int){
        
        switch index{
        case 0:
            points = points + 20
        case 1:
            points = points + 10
        case 2:
            points = points + 5
        default:
            print("")
        }
    }// end calculatePts
    
    func getPoints()-> Int{
        return points
    }
    
    func resetPoints(){
        points = 0
    }
    
}// end class
