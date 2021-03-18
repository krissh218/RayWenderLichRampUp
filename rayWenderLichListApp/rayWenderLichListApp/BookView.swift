//
//  BookView.swift
//  rayWenderLichListApp
//
//  Created by Mohan Krishna  on 3/17/21.
//

import SwiftUI

struct Book:Hashable {
    var title:String
    var author:String
    init(title:String,author:String) {
        self.title = title
        self.author = author
    }
}

extension Book {
    struct Image: View {
        let title:String
        let size:CGFloat?
        let uiImage:UIImage?
        let cornerRadius: CGFloat
        
        var body: some View {
            
            if let image = uiImage.map( SwiftUI.Image.init)
            {

                image.resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .cornerRadius(cornerRadius)
                    .padding()
            }
            else {
                let symbol = SwiftUI.Image(title:title)
                    ?? .init("title")
                symbol
                    .resizable()
                    .frame(width: size, height: size, alignment: .center)
                     .scaledToFit()
                     .font(Font.title.weight(.light))
                    .foregroundColor(.secondary)
            }
        }
    }
}


struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Book.Image(title: "title")
        }

    }
}

extension Book.Image {
    
    init(title:String) {
        self.init(title: title, size: nil, uiImage: nil, cornerRadius: .init())
    }
}

extension Image {
    init?(title: String) {
        guard let character = title.first else {
            return nil
        }
        let symbolName = "\(character.lowercased()).square"
        self.init(systemName: symbolName)
    }
}
