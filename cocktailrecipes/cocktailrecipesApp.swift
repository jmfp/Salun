//
//  cocktailrecipesApp.swift
//  cocktailrecipes
//
//  Created by Jessie Price on 3/10/24.
//

import SwiftUI
import RealmSwift
let app = RealmSwift.App(id: "application-0-mbbmh")

@main

struct Salun: SwiftUI.App {
    @StateObject var state = AppState()
    var body: some Scene {
        WindowGroup{
            Home()
                .environmentObject(state)
        }
    }
}
