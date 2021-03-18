//
//  ContentView.swift
//  rayWenderLichListApp
//
//  Created by Mohan Krishna  on 3/17/21.
//

import SwiftUI

struct ContentView: View {
    @State var imageCache = Library()

    var body: some View {
    
        NavigationView{
            List(imageCache.sortedBooks, id:\.self ) { book in
                bookRow(book: book, displayImage: $imageCache.uiImages[book])
            }
            .navigationTitle("Book List")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}

struct bookRow: View {

    let book:Book
    @Binding var displayImage:UIImage?
    
    var body: some View {
        
        NavigationLink(
            destination: bookDetailView(book: book, displayImage: $displayImage)) {
            HStack {
                Book.Image(title: "\(book.title)", size:80, uiImage: displayImage, cornerRadius: 12 )
                TitleAndAuthorView(book: book, titleFont: .title, authorFont: .title)
                
            }
        }
        
        
    }
}

struct TitleAndAuthorView: View {
    let book:Book
    let titleFont:Font
    let authorFont:Font
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text("\(book.title)")
                .font(titleFont)
                .foregroundColor(.primary)
            Text("\(book.author)")
                .font(authorFont)
                .foregroundColor(.secondary)
        })
    }
}
