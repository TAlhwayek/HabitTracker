//
//  EditToDoView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/23/24.
//

import SwiftUI

struct ExpandToDoView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var toDo: ToDo
    
    let priorities = ["Low", "Medium", "High"]
    
    var body: some View {
        
        NavigationStack {
            List {
                TextField("Title", text: $toDo.title)
                TextField("Description", text: $toDo.description)
                Picker("Priority", selection: $toDo.priority) {
                    ForEach(priorities, id: \.self) {
                        Text($0)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        // Somehow update data here
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ExpandToDoView(toDo: ToDo(title: "Test", description: "Test desc", priority: "Low"))
}

//        NavigationStack {
//            List {
//                HStack {
//                    Text("Title:")
//                    Spacer()
//                    Text(toDo.title)
//                }
//
//                HStack {
//                    Text("Description:")
//                    Spacer()
//                    Text(toDo.description)
//                }
//
//                HStack {
//                    Text("Priority:")
//                    Spacer()
//                    Text(toDo.priority)
//                        .priorityStyle(for: toDo)
//                }
//            }
//            .navigationTitle("View To-do")
//            .navigationBarTitleDisplayMode(.inline)
