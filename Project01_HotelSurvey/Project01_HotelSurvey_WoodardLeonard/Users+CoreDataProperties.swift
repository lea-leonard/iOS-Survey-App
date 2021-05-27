//
//  Users+CoreDataProperties.swift
//  Project01_HotelSurvey_WoodardLeonard
//
//  Created by Lea Leonard on 5/2/21.
//  Copyright © 2021 Lea Leonard. All rights reserved.
//
//

import Foundation
import CoreData


public extension Users {

    @nonobjc class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var id: String?
    @NSManaged public var pin: String?

}

extension Users : Identifiable{
    
}
