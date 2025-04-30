//
//  CalorieFullView.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/28/25.
//

import SwiftUI
import SwiftData

struct CalorieFullView: View {
    let calorie: CalorieData
    
    var body: some View {
        Text("")
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: CalorieData.self, configurations: config)
    // This code is required in order to test SwiftData in previews without crashing.
    
    let calorie = CalorieData(date: Date.now, carbs: 20, protein: 30, satFat: 10, unsatFat: 2, transFat: 0, name: "Nice Food")
    
    return CalorieFullView(calorie: calorie)
        .modelContainer(container)
}
