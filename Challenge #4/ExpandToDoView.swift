//
//  EditToDoView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/23/24.
//

import SwiftUI

struct ExpandToDoView: View {
    @Environment(\.dismiss) var dismiss
    
    var toDo: ToDo
    let priorities = ["Low", "Medium", "High"]
    
    var body: some View {
        @State var title: String = toDo.title
        @State var description: String = toDo.description
        @State var priority: String = toDo.priority
        @State var wasAdded: Bool = toDo.wasAdded
        
        NavigationStack {
            List {
                HStack {
                    Text("Title:")
                    Spacer()
                    Text(toDo.title)
                }
                
                HStack {
                    Text("Description:")
                    Spacer()
                    Text(toDo.description)
                }
                         
                HStack {
                    Text("Priority:")
                    Spacer()
                    Text(toDo.priority)
                        .priorityStyle(for: toDo)
                }
            }
//            .navigationTitle("View To-do")
//            .navigationBarTitleDisplayMode(.inline)

        }
    }
}

#Preview {
    ExpandToDoView(toDo: ToDo(title: "Test", description: "Test desc", priority: "Low", wasAdded: true))
}
