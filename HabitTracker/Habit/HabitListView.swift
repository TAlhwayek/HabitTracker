//
//  ContentView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import ConfettiSwiftUI
import SwiftUI

// TODO:

// Set up 'times completed' - DONE
//              Maybe add done button on detailview
//              Also allow edits in detailview?
//              Make it rain confetti once done
// Check challenge webpage
// Maybe extra themes?


// Maybe sort todolist by priority
//              or put them in another section that shows completed today
//              Then reset daily

// Save settings and load (UserDefaults) - DONE
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
    @AppStorage("ShowConfetti") private var showConfetti: Bool = true
    @AppStorage("PerformVibration") private var performVibration: Bool = true
    @State private var confettiCounter = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(habits.habitsArray) { habit in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(habit.title)
                                    .font(.title2.bold())
                            }
                            
                            HStack {
                                Text(habit.description)
                                    .font(.caption)
                                
                                Spacer()
                                
                                Text("Times completed: \(habit.timesCompleted)")
                                    .font(.caption)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {}.onLongPressGesture(minimumDuration: 0.3) {
                            // THIS IS A PLACEHOLDER SINCE I FOUND A FIX WHEN I WAS USING THIS BEFORE
                            // KEEPING IT HERE IN CASE I NEED IT
                            // LEAVE ME ALONE
                        }
                        .swipeActions(edge: .trailing) {
                            Button() {
                                if let index = habits.habitsArray.firstIndex(where: { $0.id == habit.id }) {
                                    habits.habitsArray[index].timesCompleted += 1
                                    if showConfetti {
                                        confettiCounter += 1
                                    }
                                    
                                    if performVibration {
                                        vibrate()
                                    }
                                }
                            } label: {
                                Label("Complete", systemImage: "checkmark.circle")
                            }
                            .tint(.green)
                            
                            Button(role: .destructive) {
                                removeHabit(habit)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        
                        .swipeActions(edge: .leading) {
                            
                        }
                    }
                    
                }
                .listStyle(.plain)
                .navigationTitle("Habit Tracker")
                .navigationBarTitleDisplayMode(.inline)
                .confettiCannon(counter: $confettiCounter, num: 50, openingAngle: Angle.degrees(60), closingAngle: Angle.degrees(120), radius: 450)
                
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
                            .presentationDetents([.height(480), .large])
                            .presentationDragIndicator(.visible)
                    }
                }
            }
        }
    }
    
    func removeHabit(_ habit: Habit) {
        if let index = habits.habitsArray.firstIndex(where: { $0.id == habit.id }) {
            habits.habitsArray.remove(at: index)
        }
    }
    
    private func vibrate() {
        let feedback = UIImpactFeedbackGenerator(style: .medium)
        feedback.impactOccurred()
    }
}

#Preview {
    HabitListView()
}
