//
//  ContentView.swift
//  Isister
//
//  Created by Daniel Molina on 19/3/24.
//

import SwiftUI
//import CoreData

struct LoginView: View {
    
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) var viewContext
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var isSecured: Bool = true

    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                Circle().scale(1.35).foregroundColor(.white)
                
                VStack {
                    Text("Login.title")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Login.user", text: $username)
                        .padding()
                        .frame(width:300,height:50)
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongUsername))
                    ZStack(alignment: .trailing) {
                        Group {
                            if isSecured {
                                SecureField("Login.password", text: $password)
                                    .padding()
                                    .frame(width:300,height:50)
                                    .cornerRadius(10)
                                    .border(.red,width: CGFloat(wrongPassword))
                            } else {
                                TextField("Login.password", text: $password)
                                    .padding()
                                    .frame(width:300,height:50)
                                    .cornerRadius(10)
                                    .border(.red,width: CGFloat(wrongPassword))
                            }
                        }
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye").accentColor(.gray)
                        }
                    }
                    Button("Login.button") {
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width:300,height:50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: HomeView(), isActive: $showingLoginScreen) {
                            EmptyView()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }

    func authenticateUser(username: String, password: String) {

        IsisterServer.shared.authentication(username, password) {
            (auth) in
            print(auth)
            
            var newCredential = Credential(context: self.viewContext)
            newCredential.access_token = auth.access_token
            newCredential.expires_in = Int64(auth.expires_in ?? 0)
            newCredential.refresh_token = auth.refresh_token
            newCredential.token_type = auth.token_type
            
            do {
                try self.viewContext.save()
                print("Todo saved!")
            } catch {
                print("whoops \\(error.localizedDescription)")
            }
            
            showingLoginScreen = true
            
        } failure: {
            (error) in
                print(error)
            showingLoginScreen = false
        }
    }
}

/*
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()*/

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()//.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}*/
