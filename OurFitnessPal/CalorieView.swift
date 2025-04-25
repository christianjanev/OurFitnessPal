//
//  CalorieView.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/24/25.
//

import SwiftUI
import SwiftData

struct CalorieView: View {
    let calorie: CalorieData
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(calorie.name)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    Text(calorie.date.formatted(date: .omitted, time: .shortened))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                }
                
                Text("\(getCalorieCount(calorie: calorie))")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 40)
        .padding()
        .border(Color.black)
    }
}

func getCalorieCount(calorie: CalorieData) -> Double {
    let carbsCalories = calorie.carbs * 4
    let proteinCalories = calorie.protein * 4
    let totalFat = calorie.satFat + calorie.unsatFat + calorie.transFat
    let fatCalories = totalFat * 9
    return carbsCalories + proteinCalories + fatCalories
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: CalorieData.self, configurations: config)
    // This code is required in order to test SwiftData in previews without crashing.
    
    let calorie = CalorieData(date: Date.now, carbs: 20, protein: 30, satFat: 10, unsatFat: 2, transFat: 0, name: "Nice Food")
    
    return CalorieView(calorie: calorie)
        .modelContainer(container)
}
