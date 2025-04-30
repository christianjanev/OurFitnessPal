//
//  UserData.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/28/25.
//

import SwiftData
import Foundation

@Model
class UserData {
    var proteinGoal: Double
    var carbGoal: Double
    var fatGoal: Double
    var waterGoal: Double
    var weights: [Date: Double]
    var firstTimeRun: Bool = true
    
    init(proteinGoal: Double, carbGoal: Double, fatGoal: Double, waterGoal: Double, weights: [Date : Double], firstTimeRun: Bool = true) {
        self.proteinGoal = proteinGoal
        self.carbGoal = carbGoal
        self.fatGoal = fatGoal
        self.waterGoal = waterGoal
        self.weights = weights
        self.firstTimeRun = firstTimeRun
    }
    
    func calorieGoal() -> Double {
        return proteinGoal*4 + carbGoal*4 + fatGoal*9
    }
}
