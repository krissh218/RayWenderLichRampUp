//
//  bookDetailView.swift
//  rayWenderLichListApp
//
//  Created by Mohan Krishna  on 3/17/21.
//
import PhotosUI
import SwiftUI
struct bookDetailView: View {
    
    @ObservedObject var book: Book
    @EnvironmentObject var library:Library

    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack(spacing:10) {
                 BookmarkButton(book: book)

                VStack(alignment: .leading) {
                    TitleAndAuthorView(book: book, titleFont: .title, authorFont: .title2)
                    Divider().padding(.vertical)
                    TextField("Write Review", text: $book.microReview)

                }
                
            }

            ReviewAndImageStack(book: book, displayImage:$library.uiImages[book])
        }

    }
}

struct bookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        bookDetailView(book: .init()).environmentObject(Library())

    }
}

