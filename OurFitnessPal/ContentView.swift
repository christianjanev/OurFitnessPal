//
//  ContentView.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/9/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var rawCalorieData: [CalorieData]
    @Environment(\.modelContext) var modelContext
    var calories: [Date: [CalorieData]] {
        Dictionary(grouping: rawCalorieData) { calorie in
            Calendar.current.startOfDay(for: calorie.date)
        }
    }
    
    @State var selectedTab = 2
    
    
    // nutritionix--database for foods qr code
    // cloudkit--save data to cloud
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                DietView()
                    .tabItem { Label("Diet", systemImage: "fork.knife.circle") }
                    .tag(1)
                
                VStack(){
                    
                    //Main Title
                    Text("OurFitnessPal")
                        .font(.system(size: 40))
                    
                    Text("Remain")
                        .font(.system(size: 30))
                    
                    ZStack(){
                        Text("")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 300, height: 200)
                            .background(Rectangle().fill(Color.white).shadow(radius: 3))
                        
                        Text("Calories")
                            .frame(width: 40, height: 40)
                            .offset(x: 30, y: 40)
                        
                        Text("Protein")
                        
                        Text("Carbs")
                        
                        Text("Fats")
                    }
                }
                .tabItem { Label("Overview", systemImage: "scribble") }
                .tag(2)
                
                ExerciseView()
                    .tabItem { Label("Exercise", systemImage: "dumbbell.fill") }
                    .tag(3)
            }
            Rectangle()
                .fill(Color.gray)
                .frame(height: 0.5)
                .edgesIgnoringSafeArea(.bottom)
                .offset(y: -49)
        }
    }
    
    func add(date: Date, carbs: Double, protein: Double, satFat: Double, unsatFat: Double, transFat: Double, name: String, sodium: Double = 0) {
        let calorie = CalorieData(date: date, carbs: carbs, protein: protein, satFat: satFat, unsatFat: unsatFat, transFat: transFat, name: name, sodium: sodium)
        modelContext.insert(calorie)
    }
}

#Preview {
    ContentView()
}
