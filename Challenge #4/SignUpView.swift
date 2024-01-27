//
//  SignUpView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/25/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    
    var body: some View {
        
        Spacer()
        VStack {
            Text("Sign Up")
                .font(.title.bold())
            
            Rectangle()
                .frame(height: 2)
                .padding(.horizontal, 50)
                .foregroundStyle(.clear)
                .padding(.vertical, 10)
            
            TextField("Email Address", text: $userEmail)
                .frame(maxWidth: 275)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 1)
                }
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $userPassword)
                .frame(width: 275)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                }
        }
        
        Spacer()
        Spacer()
    }
}

#Preview {
    SignUpView()
}
