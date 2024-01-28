//
//  ContentView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

// TODO:
// Save settings and load (UserDefaults) - DONE
// Set up 'times completed'
//              Maybe add done button on detailview
//              Also allow edits in detailview?
//              Make it rain confetti once done
// Check challenge webpage

// Maybe extra themes?


// Maybe sort todolist by priority

//              or put them in another section that shows completed today
//              Then reset daily
// DetailView when clicked - DONE
// Make detail view editable... somehow - DONE
// Maybe tab bar that switches between habits and to-do list? - DONE
// Maybe either strikethrough to-dos -DONE
//              That means I have to remove priority from habits - DONE
// Check theme? Maybe allow user to force dark/light mode or use system -DONE

struct HabitListView: View {
    @State private var habits = Habits()
    @State private var showSettingsSheet = false
    @AppStorage("ShowQuotes") private var showQuotes: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(habits.habitsArray.indices, id: \.self) { index in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(habits.habitsArray[index].title)
                                    .font(.title2.bold())
                            }
                            
                            HStack {
                                Text(habits.habitsArray[index].description)
                                    .font(.caption)
                                
                                Spacer()
                                
                                Text("Times completed: \(habits.habitsArray[index].timesCompleted)")
                                    .font(.caption)
                            }
                        }
                        .contentShape(Rectangle())
                        .onLongPressGesture{
                            habits.habitsArray[index].timesCompleted += 1
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .listStyle(.plain)
                .navigationTitle("Habit Tracker")
                .navigationBarTitleDisplayMode(.inline)
                
                // Quotes at the bottom
                if showQuotes {
                    Text(motivationalQuotes[19])
                        .frame(height: 80, alignment: .center)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .padding(.horizontal)
                        .bold()
                }
            }
            
            .toolbar {
                // New habit button
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddHabitView(habits: habits)) {
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
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                    }
                }
            }
        }
    }
    
    func removeItems(at offset: IndexSet) {
        habits.habitsArray.remove(atOffsets: offset)
    }
}

#Preview {
    HabitListView()
}
