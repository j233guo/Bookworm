//
//  ContentView.swift
//  Bookworm
//
//  Created by Jiaming Guo on 2022-08-29.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text("HW")
    }
}

struct ContentView_Previews: PreviewProvider {
    static let dataController = DataController()
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
    }
}
