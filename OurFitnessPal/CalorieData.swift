//
//  CalorieData.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/16/25.
//

import SwiftData
import Foundation

@Model
class CalorieData {
    var date: Date
    var carbs: Double
    var protein: Double
    var satFat: Double
    var unsatFat: Double
    var transFat: Double
    var name: String
    var sodium: Double = 0
    
    init(date: Date, carbs: Double, protein: Double, satFat: Double, unsatFat: Double, transFat: Double, name: String, sodium: Double = 0) {
        self.date = date
        self.carbs = carbs
        self.protein = protein
        self.satFat = satFat
        self.unsatFat = unsatFat
        self.transFat = transFat
        self.sodium = sodium
        self.name = name
    }
}
