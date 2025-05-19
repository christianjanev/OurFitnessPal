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
        Text(calorie.name)
            .font(.largeTitle)
        
        VStack {
            
            Spacer()
                .frame(height: 10)
            
            //HStack for Calories
            HStack(){
                Text("Calories")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                //fill in backend number
                Text("\(Int(getCalorieCount(calorie: calorie)))")
                    .font(.title)
                    .padding(.trailing, 10)
            }
            
            //Divider
            Rectangle()
                .frame(width: 275, height: 20)
            
            HStack(){
                Text("Total Fat:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                
                Text("\(Int(((calorie.satFat + calorie.unsatFat + calorie.transFat)*9).rounded()))")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, -45)
            }
            HStack(){
                Text("Saturated: \(Int(calorie.satFat.rounded()))")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 100)
                
            
                
            }
            
            HStack(){
                Text("Unsaturated: \(Int(calorie.unsatFat.rounded()))")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 100)
                
            }
            
            
            HStack(){
                Text("Trans: \(Int(calorie.transFat.rounded()))")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 100)
            }
            
            Text("")
            
            HStack(){
                Text("Sodium:")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 20)
                Text("\(Int(calorie.sodium.rounded()))")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, -45)
                
            }
            
            HStack(){
                Text("Carbs: \(Int(calorie.carbs.rounded()))")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 20)
                
            }
            
            HStack(){
                Text("Protein: \(Int(calorie.protein.rounded()))")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 20)

            }
            
            HStack(){
                Text("")
            }

            
            
            
        }
        .frame(width: 275)
        .border(.black)
        .padding()
        

        
        
    }
    
    func getCalorieCount(calorie: CalorieData) -> Double {
        let carbsCalories = calorie.carbs * 4
        let proteinCalories = calorie.protein * 4
        let totalFat = getTotalFat(calorie: calorie)
        let fatCalories = totalFat * 9
        return carbsCalories + proteinCalories + fatCalories
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
