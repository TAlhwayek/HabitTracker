//
//  SignUpView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/25/24.
//

import Supabase
import SwiftUI



struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @FocusState private var keyboardFocused: Bool
    
    @State private var showError = false
    @State private var authError = ""
    
 
    
    var body: some View {
        let supabase = SupabaseClient(supabaseURL: URL(string: Secrets.url)!, supabaseKey: Secrets.key)
        let auth = supabase.auth

        Spacer()
        VStack {
            Text("Sign Up")
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
                .focused($keyboardFocused)
            
            Button {
                Task {
                    do {
                        try await auth.signUp(
                            email: userEmail,
                            password: userPassword
                        )
                        keyboardFocused = false
                        
                        dismiss()
                        
                    } catch {
                        print(error.localizedDescription)
                        authError = error.localizedDescription
                        showError = true
                    }
                }
            } label: {
                Text("Sign Up")
                    .frame(width: 150)
                    .foregroundStyle(Color(uiColor: .label))
                    .padding(10)
                    .background(.blue)
                    .contentShape(RoundedRectangle(cornerRadius: 20))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
        }
        .alert("Error", isPresented: $showError) {
            Button("OK") { }
        } message: {
            Text(authError)
        }
        
        Spacer()
        Spacer()
    }
}

#Preview {
    SignUpView()
}
