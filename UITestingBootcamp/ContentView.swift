    //
    //  ContentView.swift
    //  UITestingBootcamp
    //
    //  Created by Jiten Patel on 10/01/23.
    //

import SwiftUI

class UITestingBootcampViewModel: ObservableObject{
    
    let placeholderText: String = "Add your name..."
    @Published var textFieldText: String = ""
    @Published var currentUserIsSignedIn: Bool = false
    
    func signUpButtonPressed(){
        guard !textFieldText.isEmpty else{
            return
        }
        currentUserIsSignedIn = true
    }
    
}

struct ContentView: View {
    
    @StateObject private var vm = UITestingBootcampViewModel()
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            ZStack{
                if vm.currentUserIsSignedIn{
                    SignedInHomeView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
                
                if !vm.currentUserIsSignedIn{
                    signUpLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
            }
            
            
            
            
        }
    }
}

extension ContentView{
    private var signUpLayer: some View{
        VStack{
            TextField(vm.placeholderText, text: $vm.textFieldText)
                .font(.headline)
                .padding( )
                .background(Color.white)
                .cornerRadius(10)
                .accessibilityIdentifier("SignUpTextField")
            
            Button(action: {
                withAnimation(.spring()){
                    vm.signUpButtonPressed()
                }
                
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            })
            .accessibilityIdentifier("SignUpButton")
            
        }
        .padding()
    }
}

struct SignedInHomeView: View{
    
    @State private var showAlert: Bool = false
    
    var body: some View{
        NavigationView{
            VStack(spacing: 20){
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Text("Show Welcome Alert!")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.red)
                        .cornerRadius(10)
                })
                .accessibilityIdentifier("showAlertButton")
                .alert(isPresented: $showAlert, content: {
                    return Alert(title: Text("Welcome to the App!!!"))
                })
                
                
                NavigationLink(destination: Text("Destination"), label: {
                    Text("Navigate")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
                .accessibilityIdentifier("navigationLinkToDestination")
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
