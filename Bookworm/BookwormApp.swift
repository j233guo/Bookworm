//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Jiaming Guo on 2022-08-29.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
