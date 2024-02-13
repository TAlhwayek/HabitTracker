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
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(toDo.title)
                .font(.title2.bold())
            
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
//        .onTapGesture {
//            //            isActive.toggle()
//        }
//        .onLongPressGesture {
//            // Mark as completed?
//            withAnimation {
//                toDo.isCompleted.toggle()
//            }
//        }
    }
}

#Preview {
    ListRowView(toDo: ToDo(title: "Go to the gym", desc: "Stay motivated", priority: "High", isCompleted: false))
}
