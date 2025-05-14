//
//  OurFitnessPalApp.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/9/25.
//

import SwiftUI
import SwiftData

class AppState : ObservableObject {
    @Published var launchID = UUID()
}

@main
struct OurFitnessPalApp: App {
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .id(appState.launchID)
                .environmentObject(appState)
        }
        .modelContainer(for: [CalorieData.self, UserData.self])
    }
}
