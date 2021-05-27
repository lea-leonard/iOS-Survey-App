//
//  SurveyListViewController.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 4/29/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import UIKit

open class SurveyListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    var cellTitle = ["Rooms", "Dining", "Spas", "Gyms"]
    //var cellButtons = [UIButton]()

    @IBOutlet weak var tblSelectSurvey: UITableView!
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        /*self.cellButtons = [UIButton.init(type:UIButton.ButtonType(rawValue: 1)!),
        UIButton.init(type:UIButton.ButtonType(rawValue: 1)!),
        UIButton.init(type:UIButton.ButtonType(rawValue: 1)!),
        UIButton.init(type:UIButton.ButtonType(rawValue: 1)!)]
        */
        tblSelectSurvey.rowHeight = CGFloat(100.0)
               
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         switch section{
         case 0:
            return cellTitle.count
        default :
            return 0
        }
    }
    

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
              
        // when a row is selected go to the it's service Survey view
        switch indexPath.row {
        case 0:
            // room cell
            let getBD0 = UIStoryboard(name: "Services", bundle: nil)
            let Rooms = getBD0.instantiateViewController(withIdentifier: "SurveyView") as! SurveyQViewController
                self.present(Rooms, animated: true, completion: {Rooms.lblSurveyTitle.text = "Rate Our Rooms"; Rooms.currentSurvey = "Rooms"; Rooms.s; Rooms.setSurvey()
                })           
                let cell = tableView.cellForRow(at:indexPath)
                cell?.isUserInteractionEnabled = false
                cell?.contentView.backgroundColor = .systemYellow
      
        case 1:
            let cell = tableView.cellForRow(at:indexPath)
            cell?.isUserInteractionEnabled = false
            cell?.contentView.backgroundColor = .systemYellow
            let getBD1 = UIStoryboard(name: "Services", bundle: nil)
            let Dine = getBD1.instantiateViewController(withIdentifier: "SurveyView") as! SurveyQViewController
            self.present(Dine, animated: true, completion: {Dine.lblSurveyTitle.text = "Rate Our Food"; Dine.currentSurvey = "Dine"; Dine.s; Dine.setSurvey()
            })
        case 2:
            let cell = tableView.cellForRow(at:indexPath)
            cell?.isUserInteractionEnabled = false
            cell?.contentView.backgroundColor = .systemYellow
           let getBD1 = UIStoryboard(name: "Services", bundle: nil)
           let Spa = getBD1.instantiateViewController(withIdentifier: "SurveyView") as! SurveyQViewController
           self.present(Spa, animated: true, completion: {Spa.lblSurveyTitle.text = "Rate Our Spa"; Spa.currentSurvey = "Spa"; Spa.s; Spa.setSurvey()
           })
        case 3:
            let cell = tableView.cellForRow(at:indexPath)
            cell?.isUserInteractionEnabled = false
            cell?.contentView.backgroundColor = .systemYellow
            let getBD1 = UIStoryboard(name: "Services", bundle: nil)
            let Gym = getBD1.instantiateViewController(withIdentifier: "SurveyView") as! SurveyQViewController
            self.present(Gym, animated: true, completion: {Gym.lblSurveyTitle.text = "Rate Our Gyms"; Gym.currentSurvey = "Gym"; Gym.s; Gym.setSurvey()
            })
        default:
            print("")
            }
   }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let c1 = tableView.dequeueReusableCell(withIdentifier: "cellRoom", for: indexPath) as! RoomTableViewCell
        
        let c2 = tableView.dequeueReusableCell(withIdentifier: "cellDine", for: indexPath) as! DineTableViewCell
        
        let c3 = tableView.dequeueReusableCell(withIdentifier: "cellSpa", for: indexPath) as! SpaTableViewCell
        
        let c4 = tableView.dequeueReusableCell(withIdentifier: "cellGym", for: indexPath) as! GymTableViewCell
        
        switch indexPath.section{
        case 0:
            c1.lblRoom.text = "Rate Our \(cellTitle[indexPath.row])"
            return c1
        case 1:
            c2.lblDine.text = "Rate Our \(cellTitle[indexPath.row])"
            return c2
        case 2:
            c3.lblSpa.text = "Rate Our \(cellTitle[indexPath.row])"
            return c3
        case 3:
            c4.lblGym.text = "Rate Our \(cellTitle[indexPath.row])"
            return c4
        default:
            return c1
        }// end switch
        
    }
    @IBAction func btnSubmit(_ sender: UIButton) {
        // user cancels sign up
        let getSB = UIStoryboard(name: "ExitSurvey", bundle: nil)
        
        let Overall = getSB.instantiateViewController(withIdentifier: "RateOverall") as! RateOverallViewController
        
        self.present(Overall, animated: true, completion: nil)
        
    }
    
}
