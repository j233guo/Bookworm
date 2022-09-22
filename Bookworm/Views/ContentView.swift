//
//  ContentView.swift
//  Bookworm
//
//  Created by Jiaming Guo on 2022-08-29.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddBookScreen = false
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let book = books[offset]
            // delete it from the context
            moc.delete(book)
        }
        // save the context
        try? moc.save()
    }
    
    var body: some View {
        NavigationView {
            Group {
                if books.count == 0 {
                    VStack {
                        Text("No Book")
                            .font(.largeTitle)
                            .foregroundColor(.secondary)
                        Text("Press \"+\" button on the top right to add a book")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                } else {
                    List {
                        ForEach(books) { book in
                            NavigationLink {
                                BookDetailView(book: book)
                            } label: {
                                HStack {
                                    EmojiRatingView(rating: book.rating)
                                        .font(.largeTitle)
                                    VStack(alignment: .leading) {
                                        Text(book.title ?? "Unknown Title")
                                            .font(.headline)
                                        Text(book.author ?? "Unknown Author")
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deleteBooks)
                    }
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddBookScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddBookScreen) {
                AddBookView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let dataController = DataController()
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
