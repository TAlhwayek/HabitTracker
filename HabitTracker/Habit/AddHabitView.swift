//
//  AddHabitView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftData
import SwiftUI

struct AddHabitView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var description = ""
    @Binding var habits: [Habit]
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add a New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        let newHabit = Habit(title: title, desc: description, timesCompleted: 0)
                        modelContext.insert(newHabit)
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
        }
    }
}

#Preview {
  AddHabitView(habits: .constant([])) // Provide an empty array for preview
}
