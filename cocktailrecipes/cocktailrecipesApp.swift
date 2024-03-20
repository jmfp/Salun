//
//  cocktailrecipesApp.swift
//  cocktailrecipes
//
//  Created by Jessie Price on 3/10/24.
//

import SwiftUI
import RealmSwift
import Firebase

let app = RealmSwift.App(id: "application-0-mbbmh")

@main

struct Salun: SwiftUI.App {
    init(){
        FirebaseApp.configure()
    }
    @StateObject var state = AppState()
    var body: some Scene {
        WindowGroup{
            Home()
                .environmentObject(state)
        }
    }
}
