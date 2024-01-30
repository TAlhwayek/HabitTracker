//
//  EditToDoView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/23/24.
//

import SwiftUI

struct EditToDoView: View {
    @Binding var toDo: ToDo
    @Environment(\.dismiss) var dismiss
    @State private var toDos = ToDos()
    @State private var initialToDo: ToDo
    
    let priorities = ["Low", "Medium", "High"]
    
    // Helps the cancel button work since changes are made as the user edits
    init(toDo: Binding<ToDo>) {
        _toDo = toDo
        _initialToDo = State(initialValue: toDo.wrappedValue)
    }
    
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
                        // Updates class, which updates user defaults
                        if let index = toDos.toDosArray.firstIndex(where: { $0.id == toDo.id }) {
                            toDos.toDosArray[index] = toDo
                        }
                        
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        // Reset edited values
                        toDo = initialToDo
                        dismiss()
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationBarBackButtonHidden()
        }
        .onAppear {
            // Store initial ToDo when the view appears
            initialToDo = toDo
        }
    }
}



#Preview {
    EditToDoView(toDo: .constant(ToDo(title: "Test", description: "Test desc", priority: "Low")))
}
