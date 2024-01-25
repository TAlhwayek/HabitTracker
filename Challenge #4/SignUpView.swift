//
//  SignUpView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/25/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var emailAddress: String = ""
    
    var body: some View {
        TextField("Email Address", text: $emailAddress)
            .frame(maxWidth: 250)
            .padding()
            .overlay(
               RoundedRectangle(cornerRadius: 10)
                  .stroke(.blue, lineWidth: 2)
             )
//            .foregroundStyle(.white)
        
    }
}

#Preview {
    SignUpView()
}
