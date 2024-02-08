//
//  ListRowView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/20/24.
//

import SwiftData
import SwiftUI

struct ListRowView: View {
    @Environment(\.modelContext) var modelContext_toDo
    
    var toDo: ToDo
    
    // Used to show edit view
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(toDo.title)
                        .font(.title2.bold())
                }
                
                HStack {
                    Text(toDo.desc)
                        .font(.caption)
                    
                    Spacer()
                    
                    Text(toDo.priority)
                        .font(.caption)
                        .priorityStyle(for: toDo)
                    
                }
            }
            .contentShape(Rectangle())
            .strikethrough(toDo.isCompleted)
            .onTapGesture {
                isActive.toggle()
            }
            .onLongPressGesture {
                // Mark as completed?
                withAnimation {
                    toDo.isCompleted.toggle()
                }
            }
        }
        .navigationDestination(isPresented: $isActive) {
//            EditToDoView(toDo: $toDo)
        }
    }
}

#Preview {
    ListRowView(toDo: ToDo(title: "Go to the gym", desc: "Stay motivated", priority: "High", isCompleted: false))
}
