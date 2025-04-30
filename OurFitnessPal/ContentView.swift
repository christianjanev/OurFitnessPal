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
    @Query var userData: [UserData]
    @Environment(\.modelContext) var modelContext
    var calories: [Date: [CalorieData]] {
        Dictionary(grouping: rawCalorieData) { calorie in
            Calendar.current.startOfDay(for: calorie.date)
        }
    }
    
    @State var selectedTab = 2
    @State var firstRun = true
    
    
    // nutritionix--database for foods qr code
    // cloudkit--save data to cloud
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                DietView()
                    .tabItem { Label("History", systemImage: "fork.knife.circle") }
                    .tag(1)
                
                VStack(){
                    
                    //Main Title
                    Text("OurFitnessPal")
                        .font(.system(size: 40))
                        .frame(width: 700, height: 60)
//                        .background(Color.green)
                        
                    Divider()
                    
                    Text("Overview")
                        .font(.system(size: 30))
                    // \(userData.first?.calorieGoal() ?? 0)
                    ZStack(){
                        Text("")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 300, height: 240)
                            .background(Rectangle().fill(Color.white).shadow(radius: 3))
                        
                        
                        //Calorie Number
                        Text("")
                            .offset(x: 0, y: -50)
                        
                        Text("Calories")
                            .frame(width: 70, height: 10)
                            .offset(x: 0, y: -15)
                            .opacity(0.6)

                        
                        //Protein Number
                        Text("")
                            .offset(x: 40, y: 30)
                        Text("Protein")
                            .frame(width: 70, height: 10)
                            .offset(x: -100, y: 70)
                            .opacity(0.6)

                        
                        
                        Text("Carbs")
                            .frame(width: 70, height: 10)
                            .offset(x: 5, y: 70)
                            .opacity(0.6)
                        
                        Text("Fats")
                            .frame(width: 70, height: 10)
                            .offset(x: 100, y: 70)
                            .opacity(0.6)
                        
                        //Button for adding water
                        Button(){
                        } label: {
                            Image(systemName: "plus.app.fill")
                        }
                        .font(.system(size: 40))
                        .offset(x: 5, y: 120)
                    }//Closing ZStack
                    .padding(.bottom, 20)
                    
                    
                    //************ Water Section
                    //ZStack for water section
                    ZStack(){
                        Text("")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 300, height: 75)
                            .background(Rectangle().fill(Color.white).shadow(radius: 3))
                        
                        Text("Fluid Ounces")
                            .frame(width: 100, height: 10)
                            .offset(x: -90, y: 20)
                            .opacity(0.6)
                        Image(systemName: "drop.fill")
                            .foregroundColor(.cyan)
                        
                        //Button for adding water
                        Button(){
                        } label: {
                            Image(systemName: "plus.app.fill")
                        }
                        .font(.system(size: 40))
                        .offset(x: 110, y: 0)

                    } //closing waterZStack
                    .padding()
                    
                    Divider()
                    
                    //***************Exercise Plan
                    Text("Exercise Plan")
                        .frame(width: 200, height: 40)
                        .offset(x: -95, y: 0)
                        .font(.system(size: 20))
                    ZStack(){
                        Text("")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 300, height: 75)
                            .background(Rectangle().fill(Color.white).shadow(radius: 3))
                    }
                    
                    
                    
                    //***************Recommended Foods
                    Text("Recommended Foods")
                        .frame(width: 300, height: 40)
                        .offset(x: -55, y: 0)
                        .font(.system(size: 20))
                    ZStack(){
                        Text("")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 300, height: 75)
                            .background(Rectangle().fill(Color.white).shadow(radius: 3))
                    }
                } //Closing VStack
                
                
                //The toolbar Menu
                .tabItem { Label("Overview", systemImage: "scribble") }
                .tag(2)
                ExerciseView()
                    .tabItem { Label("Diet", systemImage: "dumbbell.fill") }
                    .tag(3)
                ///End of toolbar Menu
                
                
            } //Closing TabView
            Rectangle()
                .fill(Color.gray.opacity(0.5))
                .frame(height: 0.5)
                .edgesIgnoringSafeArea(.bottom)
                .offset(y: -49)
            
            
        } //Closing ZStack
        .onAppear() {
            if (!userData.isEmpty) {
                firstRun = false
            }
        }
        .sheet(isPresented: $firstRun) {
            
        }
    } //Closing SomeView
    
    func add(date: Date, carbs: Double, protein: Double, satFat: Double, unsatFat: Double, transFat: Double, name: String, sodium: Double = 0) {
        let calorie = CalorieData(date: date, carbs: carbs, protein: protein, satFat: satFat, unsatFat: unsatFat, transFat: transFat, name: name, sodium: sodium)
        modelContext.insert(calorie)
    } //Closing add Func
} //closing Content View

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: CalorieData.self, UserData.self, configurations: config)
    // This code is required in order to test SwiftData in previews without crashing.
    
    let calorie = CalorieData(date: Date.now, carbs: 20, protein: 30, satFat: 10, unsatFat: 2, transFat: 0, name: "Nice Food")
    let user = UserData(proteinGoal: 150, carbGoal: 325, fatGoal: 75, waterGoal: 338, weights: [Date.now: 150], firstTimeRun: true)
    
    container.mainContext.insert(user)
    
    return ContentView()
        .modelContainer(container)
} //Closing #Preview
