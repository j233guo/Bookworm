//
//  ContentView.swift
//  Bookworm
//
//  Created by Jiaming Guo on 2022-08-29.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddBookScreen = false
    
    var body: some View {
        NavigationView {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddBookScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
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
