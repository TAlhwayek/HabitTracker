//
//  EditToDoView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/23/24.
//

import SwiftData
import SwiftUI

struct EditToDoView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var toDo: ToDo
    @State var initialToDo = ToDo(title: "", desc: "", priority: "Low", isCompleted: false)
    
    let priorities = ["Low", "Medium", "High"]
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Title", text: $toDo.title)
                TextField("Description", text: $toDo.desc)
                Picker("Priority", selection: $toDo.priority) {
                    ForEach(priorities, id: \.self) {
                        Text($0)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        // Reset edited values
                        resetToDo()
                        dismiss()
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationBarBackButtonHidden()
        }
        .onAppear {
            copyToDo()
        }
    }
    
    func copyToDo() {
        initialToDo.title = toDo.title
        initialToDo.desc = toDo.desc
        initialToDo.priority = toDo.priority
        initialToDo.isCompleted = toDo.isCompleted
    }
    
    func resetToDo() {
        toDo.title = initialToDo.title
        toDo.desc = initialToDo.desc
        toDo.priority = initialToDo.priority
        toDo.isCompleted = initialToDo.isCompleted
    }
}



#Preview {
    EditToDoView(toDo: ToDo(title: "", desc: "", priority: "", isCompleted: false), initialToDo: ToDo(title: "", desc: "", priority: "", isCompleted: false))
}
