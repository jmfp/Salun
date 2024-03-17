//
//  ContentView.swift
//  cocktailrecipes
//
//  Created by Jessie Price on 3/10/24.
//

import SwiftUI
import WebKit



struct ContentView: View {
    @State private var drinkRecipe = [Recipe]()
    @State private var drinkText = ""
    @State private var currentDrink = 0
    @State private var ID="https://www.youtube.com/embed/YsE_igrPXZs"
    var body: some View {
        ZStack{
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack {
                
                if(drinkRecipe.count > 0){
                    HStack{
                        TextField("Search", text: $drinkText).padding(.leading).textFieldStyle(.roundedBorder)
                        Button("Search"){
                            Task{
                                do{
                                    drinkRecipe = try await fetchRecipe(drinkName: drinkText
                                    )
                                    currentDrink = 0
                                }catch{
                                    print(error)
                                }
                                
                            }
                        }.padding(.trailing).buttonStyle(.borderedProminent)
                    }
                    
                    Text(drinkRecipe[currentDrink].strDrink)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    if (drinkRecipe[currentDrink].strVideo != nil){
                        Video(videoID: drinkRecipe[currentDrink].strVideo)
                            .frame(width: 400, height: 300)
                    }else{
                        AsyncImage(url: URL(string: drinkRecipe[currentDrink].strDrinkThumb)){image in image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFill()
                                .frame(width: 400, height: 300)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .padding(10)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    Text("Ingredients:")
                    List{
                        ForEach(drinkRecipe[currentDrink].allIngredients()) { ingredient in
                            HStack{
                                Text(ingredient.name)
                                Text(ingredient.amount)
                                AsyncImage(url: URL(string: "https://www.thecocktaildb.com/images/ingredients/\(ingredient.name).png"))
                                {image in image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .scaledToFill()
                                        .frame(width:100, height:70)
                                        .padding(10)
                                } placeholder: {
                                    Text("")
                                }
                            }
                        }
                    }
                    
                    Text(drinkRecipe[currentDrink].strInstructions)
                        .padding(.horizontal)
                    HStack{
                        if currentDrink>0{
                            Button("<"){
                                currentDrink-=1
                            }.padding(.trailing).buttonStyle(.borderedProminent)
                        }
                        if drinkRecipe.count>1 && currentDrink < drinkRecipe.count-1{
                            Button(">"){
                                currentDrink+=1
                            }.padding(.leading).buttonStyle(.borderedProminent)
                        }
                        
                    }
                }else if drinkRecipe.isEmpty{
                    HStack(alignment: .top){
                        TextField("Search", text: $drinkText).padding(.leading).textFieldStyle(.roundedBorder)
                        Button("Search"){
                            Task{
                                do{
                                    drinkRecipe = try await fetchRecipe(drinkName: drinkText
                                    )
                                }catch{
                                    print(error)
                                }
                                
                            }
                        }.padding(.trailing).buttonStyle(.borderedProminent)
                    }
                    Text("Drink Not Found")
                }
            }.preferredColorScheme(.dark)
        
        }.task {
                do{
                    drinkRecipe = try await fetchRecipe(drinkName: drinkText
                    )
                    print(drinkRecipe[currentDrink].strDrinkThumb)
                }catch{
                    print(error)
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView()
                .environment(\.colorScheme, .dark)
            ContentView()
        }
    }
}
