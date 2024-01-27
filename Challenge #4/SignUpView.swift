//
//  SignUpView.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/25/24.
//

import Supabase
import SwiftUI

let supabase = SupabaseClient(supabaseURL: URL(string: Secrets.url)!, supabaseKey: Secrets.key)
let auth = supabase.auth

struct SignUpView: View {
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    
    var body: some View {
        
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
            
            Button {
//                try await supabase.auth.signUp(
//                  email: userEmail,
//                  password: userPassword
//                )
            } label: {
                Text("Sign Up")
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
    SignUpView()
}
