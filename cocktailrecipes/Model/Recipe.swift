//
//  Recipe.swift
//  cocktailrecipes
//
//  Created by Jesse Price on 3/10/24.
//

import Foundation

enum URLError: Error{
    case invalidURL
}

struct Recipe: Decodable, Identifiable{
    let id = UUID()
    let strDrink: String
    let strGlass: String
    let strVideo: String!
    let strInstructions: String
    let strDrinkThumb: String
    let strIngredient1: String!
    let strIngredient2: String!
    let strIngredient3: String!
    let strIngredient4: String!
    let strIngredient5: String!
    let strIngredient6: String!
    let strIngredient7: String!
    let strIngredient8: String!
    let strIngredient9: String!
    let strIngredient10: String!
    let strIngredient11: String!
    let strIngredient12: String!
    let strIngredient13: String!
    let strIngredient14: String!
    let strIngredient15: String!
    let strMeasure1: String!
    let strMeasure2: String!
    let strMeasure3: String!
    let strMeasure4: String!
    let strMeasure5: String!
    let strMeasure6: String!
    let strMeasure7: String!
    let strMeasure8: String!
    let strMeasure9: String!
    let strMeasure10: String!
    let strMeasure11: String!
    let strMeasure12: String!
    let strMeasure13: String!
    let strMeasure14: String!
    let strMeasure15: String!
    func allIngredients() -> [Ingredient] {
        return [
            Ingredient(name: strIngredient1 ?? "", amount: strMeasure1 ?? ""),
            Ingredient(name: strIngredient2 ?? "", amount: strMeasure2 ?? ""),
            Ingredient(name: strIngredient3 ?? "", amount: strMeasure3 ?? ""),
            Ingredient(name: strIngredient4 ?? "", amount: strMeasure4 ?? ""),
            Ingredient(name: strIngredient5 ?? "", amount: strMeasure5 ?? ""),
            Ingredient(name: strIngredient6 ?? "", amount: strMeasure6 ?? ""),
            Ingredient(name: strIngredient7 ?? "", amount: strMeasure7 ?? ""),
            Ingredient(name: strIngredient8 ?? "", amount: strMeasure8 ?? ""),
            Ingredient(name: strIngredient9 ?? "", amount: strMeasure9 ?? ""),
            Ingredient(name: strIngredient10 ?? "", amount: strMeasure10 ?? ""),
            Ingredient(name: strIngredient11 ?? "", amount: strMeasure11 ?? ""),
            Ingredient(name: strIngredient12 ?? "", amount: strMeasure12 ?? ""),
            Ingredient(name: strIngredient13 ?? "", amount: strMeasure13 ?? ""),
            Ingredient(name: strIngredient14 ?? "", amount: strMeasure14 ?? ""),
            Ingredient(name: strIngredient15 ?? "", amount: strMeasure15 ?? ""),
        ].filter{!$0.name.isEmpty}
    }
    
}

struct Drink: Decodable{
    let drinks : [Recipe]
}


func fetchRecipe(drinkName: String) async throws -> [Recipe]{
    let endpoint = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(drinkName)"
    let formattedEndpoint = endpoint.replacingOccurrences(of: " ", with: "_")
    guard let url = URL(string: formattedEndpoint)else{
        throw URLError.invalidURL
    }
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoded = try JSONDecoder().decode(Drink.self, from: data)
    return decoded.drinks
}

struct Ingredient: Identifiable {
    let id = UUID()
    var name: String
    var amount: String
}
