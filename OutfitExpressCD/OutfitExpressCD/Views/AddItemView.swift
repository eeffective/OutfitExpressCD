//
//  AddItemView.swift
//  OutfitExpressCD
//
//  Created by Efaliso Tamerat on 12/11/2020.
//

import SwiftUI


struct AddItemView: View {
    @State var image : UIImage?
    @State var showSheet : Bool = false
    @State var showImagePicker: Bool = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var tagsString: String = ""
    @State var itemName: String = ""
    @Environment(\.managedObjectContext) var context
    @ObservedObject var newItem : ItemViewModel

    
    var body: some View{
            VStack{
                Text("Upload image")
                    .font(.system(size: 20))
                Image(uiImage: (image ?? UIImage(named: "upload"))!)
                    .resizable()
                    .frame(width: 150, height: 150)
                Button("Choose image"){
                    self.showSheet = true
                }
                .padding(20)
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Select photo"),
                                message: Text("Choose"),  buttons:[
                                    .default(Text("Photo Library")){
                                        self.showImagePicker = true
                                        self.sourceType = .photoLibrary
                                    },
                                    .default(Text("Camera")){
                                        self.showImagePicker = true
                                        self.sourceType = .camera
                                    }, .cancel()])
                }
                    
                Form {
                    Section(header: Text("Item informatioon")) {
                        TextField("Name item", text: $newItem.name)
                        TextField("Tags divided by a comma (,)", text: self.$tagsString)
                    
                    }
                    Section(){
                        Button("Save item"){
                            let tags = tagsString.components(separatedBy: ",")
                            newItem.image = image?.jpegData(compressionQuality: 0.8)
                            newItem.writeData(context: context, tagsArray: tags)
                        }
                        .sheet(isPresented: $showImagePicker){
                            ImagePicker(image: self.$image,isShown: self.$showImagePicker, sourceType: self.sourceType)
                        }
                    }
                }
            }
    }
}


//    let tag1 = CDTag(context: self.context)
//    let item1 = CDItem(context: self.context)
//    tag1.name = "Eerste tag"
//    tag1.origin = item1
//    let image = UIImage(named: "upload")
//    item1.image = image!.jpegData(compressionQuality: 0.8)
//    item1.name = "Gare kledingitem"
//
//    let tag2 = CDTag(context: self.context)
//    tag2.name = "Tweede tag"
//    tag2.origin = item1
//    try? self.context.save()

