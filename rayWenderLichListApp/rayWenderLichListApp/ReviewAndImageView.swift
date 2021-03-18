//
//  ReviewAndImageView.swift
//  rayWenderLichListApp
//
//  Created by Mohan Krishna  on 3/18/21.
//

import SwiftUI
import class PhotosUI.PHPickerViewController
struct ReviewAndImageStack: View {
    
    @State var showingAlert = false
    @State var isPresented = false
    @ObservedObject var book: Book
    @Binding var displayImage:UIImage?
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            
            let updatedButton =   Button("Update Image") {
                isPresented = true
            }
            .padding()
             .border(Color.black, width: 2)
            .foregroundColor(.primary)
            .cornerRadius(5)
            
            Book.Image(title: book.title, size: nil, uiImage: displayImage, cornerRadius: 16)
                .scaledToFit()
            
            if displayImage != nil {
                HStack(alignment:.center, spacing:10) {
                    
                    Button("Delete Image") {
                        showingAlert = true
                    }
                    .padding()
                    .border(Color.black, width: 2)
                    .foregroundColor(.primary)
                    .cornerRadius(5)
                    updatedButton
                } .padding()
            }
            
            else {
                updatedButton
            }
            
        }
        .sheet(isPresented: $isPresented, content: {
            PHPickerViewController.View(image: $displayImage)
        })

        .alert(isPresented: $showingAlert) {
            
            .init(title: Text("Delete \(book.title)"), primaryButton: Alert.Button.destructive(Text("Delete"), action: {
                displayImage = nil
            }), secondaryButton: Alert.Button.cancel())
        }
    }
}

struct ReviewAndImageStack_Previews: PreviewProvider {
    static var previews: some View {
        ReviewAndImageStack(book: .init(), displayImage: .constant(nil))
    }
}
