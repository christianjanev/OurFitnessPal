//
//  ContentView.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/9/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var calories: [CalorieData]
    @Environment(\.modelContext) var modelContext
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
                    Divider()
                    
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
                            .frame(width: 70, height: 10)
                            .offset(x: 0, y: -30)
                            .opacity(0.6)

                        
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
                    }//Closing ZStack
                    
                    
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
                    ZStack(){
                        Text("")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 300, height: 75)
                            .background(Rectangle().fill(Color.white).shadow(radius: 3))
                    }
                    
                    
                    
                    
                } //Closing VStack
                .tabItem { Label("Overview", systemImage: "scribble") }
                .tag(2)
                
                ExerciseView()
                    .tabItem { Label("Exercise", systemImage: "dumbbell.fill") }
                    .tag(3)
            } //Closing TabView
            Rectangle()
                .fill(Color.gray.opacity(0.5))
                .frame(height: 0.5)
                .edgesIgnoringSafeArea(.bottom)
                .offset(y: -49)
        } //Closing ZStack
    } //Closing SomeView
    
    func add(date: Date, carbs: Double, protein: Double, satFat: Double, unsatFat: Double, transFat: Double, name: String, sodium: Double = 0) {
        let calorie = CalorieData(date: date, carbs: carbs, protein: protein, satFat: satFat, unsatFat: unsatFat, transFat: transFat, name: name, sodium: sodium)
        modelContext.insert(calorie)
    } //Closing add Func
} //closing Content View

#Preview {
    ContentView()
} //Closing #Preview
