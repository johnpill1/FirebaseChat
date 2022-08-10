//
//  ContentView.swift
//  FirebaseChat
//
//  Created by John Pill on 10/08/2022.
//

import SwiftUI

struct LoginView: View {
    
    @State var isLogInMode = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(spacing: 16) {
                    Picker(selection: $isLogInMode, label: Text("Picker here")) {
                            Text("Login")
                            .tag(true)
                            Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding()
                    
                    if !isLogInMode {
                        Button {
                            
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                    }
                    
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(.white)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(.white)
                    
                    Button {
                        // LOGIN / CREATE ACCOUNT FUNCTION
                        handleAction()
                        
                        
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLogInMode ? "Log in" : "Create Account")
                                .foregroundColor(.white)
                                .padding()
                                .font(.system(size: 18, weight: .semibold))
                            Spacer()
                        }.background(Color.blue)
                    }
                }
                .padding()
                
            }
            .navigationTitle(isLogInMode ? "Log in" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
            .ignoresSafeArea())
            
        }
        
    
        }
    private func handleAction() {
        if isLogInMode {
            print("Login to Firebase")
        } else {
            print("Create an account in Firebase")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
