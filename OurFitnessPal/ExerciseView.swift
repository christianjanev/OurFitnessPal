//
//  ExerciseView.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/17/25.
//

import SwiftUI
import SwiftData

struct ExerciseView: View {
    @Query var rawCalorieData: [CalorieData]
    @Environment(\.modelContext) var modelContext
    var calories: [Date: [CalorieData]] {
        Dictionary(grouping: rawCalorieData) { calorie in
            Calendar.current.startOfDay(for: calorie.date)
        }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(calories.keys.sorted(), id: \.self) { date in
                    ForEach(calories[date]!, id: \.self) { calorie in
                        Text(calorie.name)
                    }
                }
            }
        }
    }
}

#Preview {
    ExerciseView()
}
