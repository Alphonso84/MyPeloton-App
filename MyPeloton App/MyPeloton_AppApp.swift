//
//  MyPeloton_AppApp.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 7/25/20.
//

import SwiftUI

@main
struct MyPeloton_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(myWorkouts: .constant(Workouts()))
        }
    }
}
