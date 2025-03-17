//
//  ToDo.swift
//  ToDoList
//
//  Created by Enzo Arantes on 3/15/25.
//

import Foundation
import SwiftData

@MainActor
@Model
class ToDo {
     var notes = ""
     var isCompleted = false
     var dueDate = Date.now + 60*60*24
     var reminderIsOn = false
     var item = ""
    
    init(notes: String = "", isCompleted: Bool = false, dueDate: Date = Date.now + 60*60*24, reminderIsOn: Bool = false, item: String = "") {
        self.notes = notes
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.reminderIsOn = reminderIsOn
        self.item = item
    }
}

extension ToDo {
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        //Add mock data
        container.mainContext.insert(ToDo(notes: "Now with IOS 16 and XCode 18", isCompleted: true, dueDate: Date.now + 60*60*24, reminderIsOn: true, item: "Create Swift Data"))
        container.mainContext.insert(ToDo(notes: "Now with IOS 16 and XCode 18", isCompleted: true, dueDate: Date.now + 60*60*24-100, reminderIsOn: true, item: "Complete BZAN videos"))
        
        return container
    }
}

