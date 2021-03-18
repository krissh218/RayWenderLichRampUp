//
//  bookDetailView.swift
//  rayWenderLichListApp
//
//  Created by Mohan Krishna  on 3/17/21.
//
import PhotosUI
import SwiftUI

struct bookDetailView: View {
    let book: Book
    @State var isPresented = false
    @Binding var displayImage:UIImage?
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            TitleAndAuthorView(book: book, titleFont: .title, authorFont: .title2)
    
            VStack(alignment: .center, spacing: 10){
                Book.Image(title: book.title, size: nil, uiImage: displayImage, cornerRadius: 16)
                    .scaledToFit()
                Button("Update Image") {
                    isPresented = true
                }
                .padding()
                .border(Color.black, width: 2)
                .foregroundColor(.primary)
                .font(Font.title.weight(.bold))
                .cornerRadius(10)

                
            }
            .sheet(isPresented: $isPresented, content: {
                        PHPickerViewController.View(image: $displayImage)
                    })
        }
//        .alert(isPresented: .constant(true)) {
//            
//
//            .init(title: Text("Delete \(book.title)"), primaryButton: Alert.Button.destructive(Text("Delete"), action: {
//                displayImage = nil
//            }), secondaryButton: Alert.Button.cancel())
//        }
    }
}

struct bookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        bookDetailView(book: .init(title: "Harry Potter", author: "JK Rowling"), displayImage: .constant(nil))
    }
}
