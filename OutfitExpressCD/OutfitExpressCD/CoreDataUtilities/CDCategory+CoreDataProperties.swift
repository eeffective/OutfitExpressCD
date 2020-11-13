//
//  CDCategory+CoreDataProperties.swift
//  OutfitExpressCD
//
//  Created by Efaliso Tamerat on 12/11/2020.
//
//

import Foundation
import CoreData


extension CDCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCategory> {
        return NSFetchRequest<CDCategory>(entityName: "CDCategory")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: CDItem?
    
    public var getName: String{
        name ?? "Category unknown"
    }

}

extension CDCategory : Identifiable {

}
