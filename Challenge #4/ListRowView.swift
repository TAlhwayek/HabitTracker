//
//  ListRowView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/20/24.
//

import SwiftUI



struct ListRowView: View {
    // Used for strikethrough
    @State private var isCompleted: Bool = false
    @State private var isActive: Bool = false
    @State private var toDos = ToDos()
    
    let toDo: ToDo
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(toDo.title)
                        .font(.title2.bold())
                }
                
                HStack {
                    Text(toDo.description)
                        .font(.caption)
                    
                    Spacer()
                    
                    Text(toDo.priority)
                        .font(.caption)
                        .priorityStyle(for: toDo)
                    
                }
            }
            .contentShape(Rectangle())
            .strikethrough(isCompleted)
            .onTapGesture {
                isActive.toggle()
            }
            .onLongPressGesture {
                withAnimation {
                    isCompleted.toggle()
                }
            }
            .navigationDestination(isPresented: $isActive) {
                          ExpandToDoView(toDo: toDo)
                      }
        }
    }
}

#Preview {
    ListRowView(toDo: ToDo(title: "TEST", description: "TEST DESC", priority: "Low"))
}
