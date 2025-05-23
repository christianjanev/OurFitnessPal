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
                
                VStack {
                    Text("\(Int(getCalorieCount(calorie: calorie)))")
                    Text("Calories")
                }
                
//                Divider()
//                
//                VStack {
//                    Text("\(Int(calorie.protein))")
//                    Text("Protein")
//                }
//                
//                Divider()
//                
//                VStack {
//                    Text("\(Int(calorie.carbs))")
//                    Text("Carbs")
//                }
//                
//                Divider()
//                
//                VStack {
//                    Text("\(Int(getTotalFat(calorie: calorie)))")
//                    Text("Fat")
//                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 40)
    }
}

func getTotalFat(calorie: CalorieData) -> Double {
    let totalFat = calorie.satFat + calorie.unsatFat + calorie.transFat
    return totalFat
}

func getCalorieCount(calorie: CalorieData) -> Double {
    let carbsCalories = calorie.carbs * 4
    let proteinCalories = calorie.protein * 4
    let totalFat = getTotalFat(calorie: calorie)
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
