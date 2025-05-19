//
//  CalorieFullView.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/28/25.
//

import SwiftUI
import SwiftData

struct CalorieFullView: View {
    @Binding var calorie: CalorieData
    
    var body: some View {
        Text(calorie.name)
            .font(.largeTitle)
        
        VStack {
            
            Text("")
            //HStack for Calories
            HStack(){
                Text("Calories")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                //fill in backend number
                Text("1909")
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
                
                Text("45")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, -45)
            }
            HStack(){
                Text("Saturated:")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 100)
                
            
                
            }
            
            HStack(){
                Text("Unsaturated:")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 100)
                
            }
            
            
            HStack(){
                Text("Trans:")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 100)
            }
            
            Text("")
            
            HStack(){
                Text("Sodium:")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 20)
                Text("45")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, -45)
                
            }
            
            HStack(){
                Text("Carbs:")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 20)
                
            }
            
            HStack(){
                Text("Sugar:")
                    .frame(width: 275, alignment: .leading)
                    .padding(.leading, 20)
                

            }
            
            HStack(){
                Text("Protein:")
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
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: CalorieData.self, configurations: config)
    // This code is required in order to test SwiftData in previews without crashing.
    
    let calorie = CalorieData(date: Date.now, carbs: 20, protein: 30, satFat: 10, unsatFat: 2, transFat: 0, name: "Nice Food")
    
    return CalorieFullView(calorie: calorie)
        .modelContainer(container)
}
