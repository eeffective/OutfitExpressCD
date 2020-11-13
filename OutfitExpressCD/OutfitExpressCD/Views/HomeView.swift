

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(entity: CDItem.entity(), sortDescriptors: []) var items: FetchedResults<CDItem>
    @State var image: Data = (UIImage(named: "upload")?.jpegData(compressionQuality: 0.8))!
    @StateObject var newItem = ItemViewModel()

    var body: some View {
//        VStack{
//            List{
//                ForEach(items, id: \.self) { item in
//                    Section(header: Text(item.getName)){
//                        Image(uiImage: UIImage(data: item.getImage) ?? UIImage(named: "upload")!)
//                            .resizable()
//                            .frame(width: 150, height: 150)
//                        Text("Tags").fontWeight(.bold)
//                        ForEach(item.tagsArray, id: \.self) { tag in
//                            Text(tag.getName)
//                                .fontWeight(.light)
//                        }
//                    }
//                    Button("Delete me"){
//                        self.context.delete(item)
//                        try? context.save()
//                    }
//                    .padding(20)
//                    .background(Color.red)
        //                }
        //            }
        //        }
        //        Button("Add new item"){
        //            newItem.isNew.toggle()
        //        }.sheet(isPresented: $newItem.isNew, content: {
        //            AddItemView(newItem: newItem)
        //        })
        NavigationView{
            ZStack{
                VStack{
                    ScrollView{
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], spacing: 20){
                            ForEach(items, id: \.self){ item in
                                VStack{
                                    VStack{
                                        Spacer()
                                        Image(uiImage: UIImage(data: item.getImage) ?? UIImage(named: "upload")!)
                                            .resizable()
                                            .scaledToFit()
                                        Text(item.getName).fontWeight(.bold).foregroundColor(.white).scaledToFit()
                                   }
                                        NavigationLink(destination: ItemView(item: item), label: {
                                            Text("More").italic().fontWeight(.light).foregroundColor(.white)
                                        })
                                    }
                                    .frame(width: 100, height: 160)
                                    .padding(5)
                                    .background(Color.gray)
                                    .cornerRadius(15)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBlue),.pink]), startPoint: .leading, endPoint: .trailing)
                                                    , lineWidth: 5)
                                    )
                                    
                                }
                            }
                        }
                    }
                }.padding()
            }.background(Color.black)
            Button("Add new item"){
                newItem.isNew.toggle()
            }.sheet(isPresented: $newItem.isNew, content: {
                AddItemView(newItem: newItem)
            })
            
        }
    }



