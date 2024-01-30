//
//  SettingsView.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showQuotes: Bool = UserDefaults.standard.bool(forKey: "ShowQuotes")
    @State private var showConfetti: Bool = UserDefaults.standard.bool(forKey: "ShowConfetti")
    @State private var performVibration: Bool = UserDefaults.standard.bool(forKey: "PerformVibration")
    @AppStorage("selectedTheme") var selectedTheme: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Habits") {
                        Toggle("Show motivational quotes", isOn: $showQuotes)
                            .onChange(of: showQuotes) {
                                UserDefaults.standard.set(showQuotes, forKey: "ShowQuotes")
                            }
                        
                        Toggle("Show confetti on completion", isOn: $showConfetti)
                            .onChange(of: showConfetti) {
                                UserDefaults.standard.set(showConfetti, forKey: "ShowConfetti")
                            }
                        
                        Toggle("Vibrate on completion", isOn: $performVibration)
                            .onChange(of: performVibration) {
                                UserDefaults.standard.set(performVibration, forKey: "PerformVibration")
                            }
                    }
                    
                    // Theme section
                    Section("Theme") {
                        HStack {
                            Text("Select Theme")
                            
                            Spacer()
                            
                            Picker("", selection: $selectedTheme) {
                                Text("Light").tag("light")
                                Text("Dark").tag("dark")
                                Text("System").tag("system")
                            }
                        }
                    }
                    
                    Section("FEEDBACK") {
                        HStack {
                            Text("Suggestions or feedback?")
                            Spacer()
                            Button() {
                                // Pre-filled data
                                let mailToString = "tony@alhwayek.com" // Replace with your email address
                                let subject = "App Feedback"
                                let mailURL = "mailto:\(mailToString)?subject=\(subject)"
                                
                                // Open mail app
                                if let url = URL(string: mailURL) {
                                    UIApplication.shared.open(url)
                                }
                            } label: {
                                Text("Email me")
                            }
                        }
                    }
                }
                
                Spacer()
                
                NavigationLink {
                    HelpView()
                } label: {
                    Text("Help")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(Color(uiColor: .label))
                        .overlay {
                            RoundedRectangle(cornerRadius: 50)
                                .stroke((.blue), lineWidth: 1)
                        }
                        .contentShape(RoundedRectangle(cornerRadius: 50))
                        .padding(.horizontal, 125)
                }
            }
        }
        // Temp fix for sheet not dynamically updating when theme is changed
        .onChange(of: selectedTheme) {
            dismiss()
        }
    }
}

#Preview {
    SettingsView()
}
