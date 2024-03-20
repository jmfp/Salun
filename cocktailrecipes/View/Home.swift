//
//  Home.swift
//  Salun
//
//  Created by Jessie Price on 3/16/24.
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
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .padding(10)
                        }placeholder: {
                            ProgressView()
                        }
                        Text("Recipes")
                            .foregroundColor(Color.white)
                        
                    }
                }
                NavigationLink(destination: Jobs()){
                    VStack{
                        AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1616781434243-b972f0c687b1?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")){image in image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .padding(10)
                        }placeholder: {
                            ProgressView()
                        }
                        Text("Bartenders")
                            .foregroundColor(Color.white)
                        
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
