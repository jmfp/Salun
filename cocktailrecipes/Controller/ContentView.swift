//
//  ContentView.swift
//  cocktailrecipes
//
//  Created by Jessie Price on 3/10/24.
//

import SwiftUI

var drinkRecipe = [Recipe]()

struct ContentView: View {
    
    var body: some View {
        VStack {
            
            if(drinkRecipe.count > 0){
                Text(drinkRecipe[0].strDrink)
                AsyncImage(url: URL(string: drinkRecipe[0].strDrinkThumb))
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(10)
                
                Text("Ingredients:")
                Text(drinkRecipe[0].strIngredient1)
                Text(drinkRecipe[0].strMeasure1)
                Text(drinkRecipe[0].strIngredient2)
                Text(drinkRecipe[0].strMeasure1)
                Text(drinkRecipe[0].strInstructions)
            }
        }
        .padding().task {
                do{
                    drinkRecipe = try await fetchRecipe()
                    print(drinkRecipe[0].strDrinkThumb)
                }catch{
                    print(error)
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
