//
//  AddBookView.swift
//  Bookworm
//
//  Created by Jiaming Guo on 2022-09-01.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    func addBook() {
        let newBook = Book(context: moc)
        newBook.id = UUID()
        newBook.title = title
        newBook.author = author
        newBook.rating = Int16(rating)
        newBook.genre = genre
        newBook.review = review
        try? moc.save()
        dismiss()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author's Name", text: $author)
                    Picker(selection: $genre, label: Text("Genre")) {
                        ForEach(genres, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                Section {
                    Picker(selection: $rating, label: Text("Rating")) {
                        ForEach(0..<6) {
                            Text("\($0)")
                        }
                    }
                    TextEditor(text: $review)
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    Button(action: {
                        addBook()
                    }, label: {
                        Text("Save")
                    })
                }
            }
            .navigationTitle("Add a Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
