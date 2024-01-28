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
    @AppStorage("selectedTheme") var selectedTheme: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Toggle("Show motivational quotes under habits", isOn: $showQuotes)
                    .padding()
                    .onChange(of: showQuotes) {
                        UserDefaults.standard.set(showQuotes, forKey: "ShowQuotes")
                    }
                
                Toggle("Show confetti on habit completion", isOn: $showConfetti)
                    .padding()
                    .onChange(of: showConfetti) {
                        UserDefaults.standard.set(showConfetti, forKey: "ShowConfetti")
                    }
                
                // Theme section
                HStack {
                    Text("Select Theme")
                    
                    Spacer()
                    
                    Picker("Select Theme", selection: $selectedTheme) {
                        Text("Light").tag("light")
                        Text("Dark").tag("dark")
                        Text("System").tag("system")
                    }
                }
                .padding(.horizontal)
                
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
