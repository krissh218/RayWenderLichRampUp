//
//  NewBookView.swift
//  rayWenderLichListApp
//
//  Created by Mohan Krishna  on 3/18/21.
//

import SwiftUI

struct NewBookView: View {
    @ObservedObject var book = Book(title: "", author: "")
    @State var image:UIImage? = nil
    @EnvironmentObject var library:Library
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content:{
                TextField("Title", text: $book.title)
                TextField("Author", text: $book.author)
                ReviewAndImageStack(book: book, displayImage: $image)
            })
            .padding()
            .navigationBarTitle("Got a new Book?")
            .toolbar(content: {
                ToolbarItem(placement: .status) {
                    Button("Add to Library") {
                        library.addNewBook(book, image: image)
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    .disabled(
                        [book.title, book.author].contains(where: \.isEmpty)
                )
                }
            })
        }

    }
}

struct NewBookView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookView().environmentObject(Library())
    }
}
