//
//  CDTag+CoreDataProperties.swift
//  OutfitExpressCD
//
//  Created by Efaliso Tamerat on 12/11/2020.
//
//

import Foundation
import CoreData


extension CDTag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTag> {
        return NSFetchRequest<CDTag>(entityName: "CDTag")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: CDItem?
    
    public var getName: String{
        name ?? "Tag unknown"
    }

}

extension CDTag : Identifiable {

}
