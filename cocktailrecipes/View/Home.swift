//
//  Home.swift
//  Salun
//
//  Created by Jesse Price on 3/16/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            HStack{
                NavigationLink(destination: ContentView()){
                    VStack{
                        AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1607622750671-6cd9a99eabd1?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")){image in image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .padding(10)
                        }placeholder: {
                            ProgressView()
                        }
                        Text("Recipes")
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
