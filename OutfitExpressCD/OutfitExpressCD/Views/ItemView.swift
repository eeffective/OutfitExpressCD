//
//  ItemView.swift
//  OutfitExpressCD
//
//  Created by Efaliso Tamerat on 13/11/2020.
//

import SwiftUI


struct ItemView: View {
    var item : CDItem
    @Environment(\.managedObjectContext) var context

    var body: some View {
            ZStack{
                Color.black.ignoresSafeArea(.all)
                VStack{
                    Text(item.getName).font(.title).padding().foregroundColor(.white)
                    Spacer()
                    Circle().fill(Color.white).frame(width: 250, height: 250).overlay(
                        Image(uiImage: UIImage(data: item.getImage) ?? UIImage(named: "upload")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 175, height: 175)
                            .overlay(RoundedRectangle(cornerRadius: 500)
                                        .stroke(LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBlue),.pink]), startPoint: .leading, endPoint: .trailing), lineWidth: 10)
                                        .frame(width: 225, height: 225)
                                        .opacity(1))
                    )
                    
                    Text("Tags").fontWeight(.bold).foregroundColor(.white)
                    ForEach(item.tagsArray, id: \.self){tag in
                        Text(tag.getName).fontWeight(.light).foregroundColor(.white).scaledToFit()
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {}, label: {
                            Text("Edit")
                                .foregroundColor(.white)
                                .frame(width: 150, height: 50)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBlue),.pink]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(15)
                        })
                        Spacer()
                        Button(action: {
                                context.delete(item)
                                try? context.save()}, label: {
                            Text("Delete")
                                .foregroundColor(.white)
                                .frame(width: 150, height: 50)
                                .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBlue),.pink]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(15)
                        })
                        Spacer()
                    }
                }.offset(y: -70)
            }
        }
}

