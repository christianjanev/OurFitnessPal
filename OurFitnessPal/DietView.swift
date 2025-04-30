//
//  DietView.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/17/25.
//

///WAS DIETVIEW AND NOW ITS HISTORY

import SwiftUI
import SwiftData

struct DietView: View {
    @Query var rawCalorieData: [CalorieData]
    @Environment(\.modelContext) var modelContext
    var calories: [Date: [CalorieData]] {
        Dictionary(grouping: rawCalorieData) { calorie in
            Calendar.current.startOfDay(for: calorie.date)
        }
    }
    
    @State var rawPickDate = Date()
    
    var body: some View {
        VStack {
            
            DatePicker("Pick Date", selection: $rawPickDate, displayedComponents: [.date])
                .padding()
            
            Divider()
            
            List {
                ForEach(calories.keys.sorted(), id: \.self) { date in
                    ForEach(calories[Calendar.current.startOfDay(for: rawPickDate)]!, id: \.self) { calorie in
                        Text(calorie.name)
                    }
                }
            }
            
            Button("Add") {
                let calorie: CalorieData = CalorieData(date: rawPickDate, carbs: 50.2, protein: 10.2, satFat: 3, unsatFat: 2, transFat: 0, name: "Food2", sodium: 100)
                modelContext.insert(calorie)
            }//closing add
        }
    }
}

#Preview {
    DietView()
}
