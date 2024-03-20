//
//  Login.swift
//  Salun
//
//  Created by Jesse Price on 3/20/24.
//

import SwiftUI
import Firebase

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        ZStack{
            VStack{
                TextField("E-mail", text: $email)
                    .textFieldStyle(.roundedBorder)
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                Button("Sign Up"){
                    register()
                }.buttonStyle(.borderedProminent)
            }
        }
        
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
