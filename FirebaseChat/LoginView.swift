//
//  ContentView.swift
//  FirebaseChat
//
//  Created by John Pill on 10/08/2022.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State var isLogInMode = false
    @State var email = ""
    @State var password = ""
    
    init() {
        if FirebaseApp.app() == nil { FirebaseApp.configure()
        }
    }
    
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
                    Text(self.loginStatusMessage).foregroundColor(.red)
                }
                .padding()
                
            }
            .navigationTitle(isLogInMode ? "Log in" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
                            .ignoresSafeArea())
            
        }
        // .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func handleAction() {
        if isLogInMode {
            print("Login to Firebase")
            loginUser()
        } else {
            print("Create an account in Firebase")
            createNewAccount()
        }
    }
    
    @State var loginStatusMessage = ""
    
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, err in
            
            if let err = err {
                print("Failed to login user:", err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                return
            }
            
            print("Successefully logged in user: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = ("Successfully logged in user: \(result?.user.uid ?? "")")
            
        }
    }
    
    
    
    
    private func createNewAccount() {
        Auth.auth().createUser(withEmail: email, password: password) {
            result, err in
            
            if let err = err {
                print("Failed to create user:", err)
                self.loginStatusMessage = "Failed to create user: \(err)"
                return
            }
            
            print("Successefully creates user: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = ("Successfully created user: \(result?.user.uid ?? "")")
            
        }
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
