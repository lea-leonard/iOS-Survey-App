//
//  RateOverallViewController.swift
//  Project01_HotelSurvey_WoodardLeonard

import UIKit

class RateOverallViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblHotelName: UILabel!
    @IBOutlet weak var lblPoints: UILabel!
    
    var Points = 0
    let y = {UIColor.systemYellow}
    let g = {UIColor.lightGray}
    
    @IBOutlet weak var starOne: UIButton!
    @IBOutlet weak var starTwo: UIButton!
    @IBOutlet weak var starThree: UIButton!
    @IBOutlet weak var starFour: UIButton!
    @IBOutlet weak var starFive: UIButton!
    @IBOutlet weak var submitTxt: UIButton!
    @IBOutlet weak var boxThanks: UIView!
    
    var stars = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boxThanks.isHidden = true
        let title = {"Thank You for Your Feedback!"}
        let sub = {"Rate Your Overall Experience"}
        lblTitle.text = title()
        lblSubTitle.text = sub()
        lblHotelName.text = "Fernbank Resort Hotel".uppercased()
        lblPoints.text = ""
        
        // set rating system to initial zero
        stars = [starOne, starTwo, starThree, starFour, starFive]
        for e in stars{
            e.tintColor = .lightGray
        }
        
    }
    
    @IBAction func btnOneStar(_ sender: UIButton) {
        // if 1st button is pressed
        switch stars[0].tintColor{
        case UIColor.lightGray:
            for e in stars{
                e.tintColor = .lightGray
            }
            stars[0].tintColor = .systemYellow
            Points = 20
            lblPoints.text = "\(Points)"
            break
        case UIColor.systemYellow:
            for e in stars{
                e.tintColor = .lightGray
            }
            Points = 0
            lblPoints.text = "\(Points)"
            break
        default:
            break
        }
   }
    
    @IBAction func btnTwoStar(_ sender: UIButton) {
        // if 2nd start is press
        switch stars[1].tintColor{
        case UIColor.lightGray:
            for i in 0...1{
                stars[i].tintColor = .systemYellow
            }
            for i in 2...4{
                stars[i].tintColor = .lightGray
            }
            Points = 40
            lblPoints.text = "\(Points)"
            break
        case UIColor.systemYellow:
            for i in 1...4{
                stars[i].tintColor = .lightGray
            }
            stars[0].tintColor = .systemYellow
            Points = 20
            lblPoints.text = "\(Points)"
            break
        default:
            break
        }
    }
    
    
    @IBAction func btnThreeStar(_ sender: UIButton) {
        // if 3rd star is press
        switch stars[2].tintColor{
        case UIColor.lightGray:
            for i in 0...2{
                stars[i].tintColor = .systemYellow
            }
            stars[3].tintColor = .lightGray
            stars[4].tintColor = .lightGray
            Points = 60
            lblPoints.text = "\(Points)"
            break
        case UIColor.systemYellow:
            for i in 2...4{
                stars[i].tintColor = .lightGray
            }
            stars[0].tintColor = .systemYellow
            stars[1].tintColor = .systemYellow
            Points = 40
            lblPoints.text = "\(Points)"
            break
        default:
            break
        }
    }
    
    @IBAction func btnFourStar(_ sender: UIButton) {
        // if 4th star is press
        switch stars[3].tintColor{
        case UIColor.lightGray:
            for i in 0...3{
                stars[i].tintColor = .systemYellow
            }
            stars[4].tintColor = .lightGray
            Points = 80
            lblPoints.text = "\(Points)"
            break
        case UIColor.systemYellow:
            for i in 3...4{
                stars[i].tintColor = .lightGray
            }
            stars[0].tintColor = .systemYellow
            stars[1].tintColor = .systemYellow
            stars[2].tintColor = .systemYellow
            Points = 60
            lblPoints.text = "\(Points)"
            break
        default:
            break
        }
    }
        
    @IBAction func btnFiveStar(_ sender: UIButton) {
        // if 5th star is press
        switch stars[4].tintColor{
        case UIColor.lightGray:
            for e in stars{
                e.tintColor = .systemYellow
            }
            Points = 100
            lblPoints.text = "\(Points)"
            break
        case UIColor.systemYellow:
            for i in 0...3{
                stars[i].tintColor = .systemYellow
            }
            stars[4].tintColor = .lightGray
            Points = 80
            lblPoints.text = "\(Points)"
            break
        default:
            break
        }
    }
    
    
    @IBAction func btnSubmit(_ sender: UIButton) {
        sender.isEnabled = false
        boxThanks.isHidden = false
    }
    
    
    @IBAction func btnOK(_ sender: UIButton) {
        // go back to Login page
        let getSB = UIStoryboard(name: "Main", bundle: nil)
        
        let loginView = getSB.instantiateViewController(withIdentifier: "Login") as! LogInViewController
        
        self.present(loginView, animated: true, completion: nil)
    }
    
}// end class

