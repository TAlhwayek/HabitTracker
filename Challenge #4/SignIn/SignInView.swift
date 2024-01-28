//
//  SignInView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/26/24.
//

import SwiftUI

struct SignInView: View {
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    
    var body: some View {
        
        Spacer()
        VStack {
            Text("Sign In")
                .font(.title.bold())
            
            // Instead of a spacer
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(.clear)
                .padding(.vertical, 10)
            
            TextField("Email Address", text: $userEmail)
                .foregroundStyle(Color(uiColor: .label))
                .frame(maxWidth: 275)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 1)
                }
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $userPassword)
                .foregroundStyle(Color(uiColor: .label))
                .frame(width: 275)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                }
                .padding(.bottom, 20)
            
            Button {
                // Handle sign up logic here
            } label: {
                Text("Sign In")
            }
            .foregroundStyle(Color(uiColor: .label))
            .padding(10)
            .frame(width: 150)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
        

        
        Spacer()
        Spacer()
    }
}

#Preview {
    SignInView()
}