//
//  MainMessagesView.swift
//  FirebaseChat
//
//  Created by John Pill on 14/08/2022.
//

import SwiftUI

struct MainMessagesView: View {
    
    @State var shouldShowLogOutOption = false
    
    private var customeNavBar: some View {
        HStack(spacing: 16){
            
            Image(systemName: "person.fill")
                .font(.system(size: 34, weight: .heavy))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Username")
                    .font(.system(size: 24, weight: .bold))
                
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 14, height: 14)
                    Text("online")
                        .font(.system(size: 12))
                }
            }
            Spacer()
            Button {
                shouldShowLogOutOption.toggle()
            } label: {
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.label))
            }
        }
        .padding()
        .actionSheet(isPresented: $shouldShowLogOutOption) {
            .init(title: Text("Settings"), message:
                    Text("What do you want to do?"), buttons: [
                        .destructive(Text("Sign Out"), action: {
                            print("Handle sign out")
                        }),
                .cancel()
            ])
        }
    }
    
    var body: some View {
        NavigationView {
            
            // NAV BAR
            VStack {
                
                customeNavBar
                messageView
            }
                .overlay(
                    newMessageButton, alignment: .bottom)
                .navigationBarHidden(true)
            }
        }
    }
    
    private var messageView: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { num in
                HStack(spacing: 16) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 32))
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 44)
                                    .stroke(Color(.label), lineWidth: 1))
                    
                    VStack(alignment: .leading) {
                        Text("Username ")
                            .font(.system(size: 16, weight: .bold))
                        Text("Message sent to user")
                            .font(.system(size: 14))
                    }
                    Spacer()
                    
                    Text("22d")
                        .font(.system(size: 14, weight: .semibold))
                }
                Divider()
                    .padding(.vertical, 8)
            } .padding(.horizontal)
            
        } .padding(.bottom, 50)
    }
    
    private var newMessageButton: some View {
        Button {
            // Code
            
        } label: {
            HStack{
                Spacer()
                Text("+ New Message")
                Spacer()
            }
            .foregroundColor(Color.white)
            .padding(.vertical)
            .background(Color.blue)
            .cornerRadius(32)
            .padding(.horizontal)
            .shadow(radius: 15)
            
        }
    }


struct MainMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView()
            .preferredColorScheme(.dark)
        
        MainMessagesView()
    }
}
