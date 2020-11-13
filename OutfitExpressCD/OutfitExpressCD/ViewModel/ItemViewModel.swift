//
//  ItemViewModel.swift
//  OutfitExpressCD
//
//  Created by Efaliso Tamerat on 12/11/2020.
//

import SwiftUI
import CoreData

class ItemViewModel : ObservableObject{
    
    @Published var name = ""
    @Published var image: Data?
    @Published var tags: NSSet?
    @Published var category: CDCategory?
    
    // for new items
    @Published var isNew = false
    
    // writing data
    func writeData(context: NSManagedObjectContext, tagsArray: [String]){
        
        
        let newItem = CDItem(context: context)
        newItem.name = name
        newItem.image = image
        for tag in tagsArray{
            let newTag = CDTag(context: context)
            newTag.name = tag
            newItem.addToTags(newTag)
        }
        // saving the data
        do{
            try context.save()
            // success closes model
            isNew.toggle()
        }
        catch{
            print(error.localizedDescription)
        }
    }
    
    
}
