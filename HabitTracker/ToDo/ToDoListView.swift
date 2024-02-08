//
//  ToDoListView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/20/24.
//

import SwiftData
import SwiftUI

struct ToDoListView: View {
    @Environment(\.modelContext) var modelContext_toDo
    
    @Query(sort: [
        SortDescriptor(\ToDo.priority),
        SortDescriptor(\ToDo.title)
    ]) var toDos: [ToDo]
    
    //    @Query(sort: (\ToDo.priority)) var toDos: [ToDo]
    
    @State private var showSettingsSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(toDos) { toDo in
                        ListRowView(toDo: toDo)
                            .swipeActions {
                                Button(role: .destructive) {
                                    removeToDo(toDo)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                .toolbar {
                    // New To-do item button
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: AddToDoView()) {
                            Image(systemName: "plus")
                        }
                    }
                    
                    // Settings button
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            showSettingsSheet.toggle()
                        }) {
                            Image(systemName: "gearshape")
                        }
                        .sheet(isPresented: $showSettingsSheet) {
                            SettingsView()
                                .presentationDetents([.height(450), .large])
                                .presentationDragIndicator(.visible)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Habit Tracker")
                .navigationBarTitleDisplayMode(.inline)
            }
            .navigationTitle("To-do List")
        }
    }
    
    func removeToDo(_ toDo: ToDo) {
        modelContext_toDo.delete(toDo)
    }
}

#Preview {
    ToDoListView()
}
