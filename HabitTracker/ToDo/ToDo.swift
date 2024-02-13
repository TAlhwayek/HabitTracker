//
//  ToDo.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/20/24.
//

import Foundation
import SwiftData

@Model
class ToDo {
    var id = UUID()
    var title: String
    var desc: String
    var priority: String
    var isCompleted: Bool = false
    
    init(id: UUID = UUID(), title: String, desc: String, priority: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.desc = desc
        self.priority = priority
        self.isCompleted = isCompleted
    }
}
