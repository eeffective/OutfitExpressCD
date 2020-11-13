//
//  CDItem+CoreDataProperties.swift
//  OutfitExpressCD
//
//  Created by Efaliso Tamerat on 12/11/2020.
//
//

import Foundation
import CoreData
import SwiftUI


extension CDItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDItem> {
        return NSFetchRequest<CDItem>(entityName: "CDItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: Data?
    @NSManaged public var category: CDCategory?
    @NSManaged public var tags: NSSet?
    
    public var getName: String {
        name ?? "Item unknown"
    }
  
    
    public var getImage: Data {
        return image ?? UIImage(named: "upload")?.jpegData(compressionQuality: 0.8)! as! Data
    }
    
    public var tagsArray: [CDTag] {
        let set = tags as? Set<CDTag> ?? []
        
        return set.sorted{
            $0.getName < $1.getName
        }
    }

}

// MARK: Generated accessors for tags
extension CDItem {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: CDTag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: CDTag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension CDItem : Identifiable {

}
