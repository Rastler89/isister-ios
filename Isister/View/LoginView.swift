//
//  ContentView.swift
//  Isister
//
//  Created by Daniel Molina on 19/3/24.
//

import SwiftUI
//import CoreData

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var isSecured: Bool = true
    /*@Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>*/

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
                        //authenticateUser(username: username, password: password)
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

    /*private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }*/
}

/*
private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()//.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
