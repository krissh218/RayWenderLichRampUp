//
//  BookView.swift
//  rayWenderLichListApp
//
//  Created by Mohan Krishna  on 3/17/21.
//

import SwiftUI
import Combine

class Book:ObservableObject {
    
   @Published var title:String
   @Published var author:String
   @Published var microReview:String
   @Published var readMe:Bool
    init(title:String = "Title",author:String = "Author",microReview:String = "",readMe:Bool = true) {
        self.title = title
        self.author = author
        self.microReview = microReview
        self.readMe = readMe
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

extension Book:Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs === rhs
    }
}

extension Book: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

extension Book: Identifiable {
    
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Book.Image(title: "title")
            BookmarkButton(book: .init(readMe:false))
            BookmarkButton(book: .init())
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
