//
//  ContentView.swift
//  rayWenderLichListApp
//
//  Created by Mohan Krishna  on 3/17/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var imageCache:Library
    @State var presentAddBook = false
    var body: some View {
    
        NavigationView{
           
            List {
                
                Button(action: {
                    presentAddBook = true
                }, label: {
                    Spacer()
                    VStack(spacing:6) {
                        Image(systemName: "book.circle")
                            .font(.system(size: 60))
                        Text("Add New Book")
                            .font(.title2)
                    }
                    Spacer()
                })
                .buttonStyle(BorderlessButtonStyle())
                .padding(.vertical,8)
                .sheet(isPresented: $presentAddBook, content: {
                    NewBookView()
                })
                ForEach(imageCache.sortedBooks) { book in
                    bookRow(book: book)
                }
            }
           
            
            .navigationTitle("Book List")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro").environmentObject(Library())
//        ForEach(ColorScheme.allCases, id: \.self) {
//             ContentView().preferredColorScheme($0)
//        }
    }
}

struct bookMarkPreviewProvider:PreviewProvider {
    
    static var previews: some View {
        HStack {
            BookmarkButton(book: .init(readMe:false))
            BookmarkButton(book: .init(readMe: true))
        }
    }
}
struct bookRow: View {

    @ObservedObject var book:Book
    @EnvironmentObject var library:Library
    
    var body: some View {
        
        NavigationLink(
            destination: bookDetailView(book: book) ) {
            HStack {
                Book.Image(title: "\(book.title)", size:80, uiImage: library.uiImages[book], cornerRadius: 12 )
                VStack(alignment:.leading) {
                    TitleAndAuthorView(book: book, titleFont:
                                        .title, authorFont: .title)
                    if !book.microReview.isEmpty {
                        Spacer()
                    }
                    TextField("Review", text: $book.microReview)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .disabled(true)
                     
                }
                Spacer(minLength: 4)
                BookmarkButton(book: book)
            }
        }
        
        
    }
}

struct BookmarkButton: View {
    @ObservedObject var book: Book
    var body: some View {
        let bookmark = "bookmark"
        Button(action: {
            book.readMe.toggle()
        }, label: {
            Image(systemName: book.readMe ? "\(bookmark).fill" : bookmark)
                .font(.system(size: 48, weight: .light))
        })
        .buttonStyle(BorderlessButtonStyle())
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
