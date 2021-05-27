//
//  LoginDataHelper.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 5/2/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class LoginDataHelper {
    // helper file for SignUpViewController
    static var dh = LoginDataHelper()
    
    // create the data context to the Core Data
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func addData(object : [String:String])-> String{
        
       let dbUsers = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context!) as! Users
                      
        dbUsers.id = object["id"]
        dbUsers.pin = object["pin"]
        
        do{
            try context?.save()
            return "data saved"
        } catch {
            return "data not saved"
        }// end do/catch
        
    }// end addData()
    
      
    func getData()-> [Users]{
        var user = [Users]()
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        do{
            user = try context?.fetch(fetchReq) as! [Users]
        }
        catch{
            print("Internal Error: can not fetch any data")
        }
        return user
    }// end getData()
    
    func deleteData(ID : String){
        let fetchData = NSFetchRequest<NSManagedObject>.init(entityName: "Users")
        fetchData.predicate = NSPredicate(format: "id == %@", ID)
        do{
            var id = try context?.fetch(fetchData)
            context?.delete(id?.first as! Users)
            try context?.save()
        }catch{
            print("Error occurred white deleting")
        }
    }
    

}// end class

