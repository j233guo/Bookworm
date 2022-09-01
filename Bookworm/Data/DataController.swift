//
//  DataController.swift
//  Bookworm
//
//  Created by Jiaming Guo on 2022-09-01.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores(completionHandler: { description, error in
            if let error = error {
                print("Failed to load data: \(error.localizedDescription)")
            }
        })
    }
}
