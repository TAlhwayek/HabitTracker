//
//  HelpView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/28/24.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                Text("Habit View:")
                    .font(.title3.bold())
                
                Text("- Swipe left to complete or delete")
            }
            .padding()
            
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(Color.gray.opacity(0.3))
                .padding(.horizontal, 15)
            
            VStack(alignment: .leading) {
                Text("To-do:")
                    .font(.title3.bold())
                Text("- Tap on a to-do item to edit it")
                Text("- Hold an item to mark it as completed")
            }
            .padding()
        }
        .padding(.horizontal, 20)
        
        Spacer()
        
    }
}

#Preview {
    HelpView()
}
