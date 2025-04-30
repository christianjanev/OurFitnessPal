//
//  ExerciseView.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/17/25.
//

///THIS WAS EXERCISE BUT NOW IS DIET

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
            //Main Title
            Text("OurFitnessPal")
                .font(.system(size: 40))
                .frame(width: 700, height: 60)
//                        .background(Color.green)
                
            Divider()
            
            Text("Weight Loss")
                .frame(width: 200, height: 40)
                .offset(x: -95, y: 0)
                .font(.system(size: 20))
            
            
            Text("Muscle Gain")
                .frame(width: 200, height: 40)
                .offset(x: -95, y: 0)
                .font(.system(size: 20))


            
            
            Text("Heart Healthy")
                .frame(width: 200, height: 40)
                .offset(x: -95, y: 0)
                .font(.system(size: 20))
            
            Text("Gut Health")
                .frame(width: 200, height: 40)
                .background(Color(.blue))
                .offset(x: -95, y: 0)
                .font(.system(size: 20))
            ZStack(){
                Text("")
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 300, height: 110)
                    .background(
                        ZStack{
                            Image("gutHealth")
                                .resizable()
                                 .scaledToFill()
                                 .frame(width: 300, height: 75)
                                 .clipped()
                                 .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(Color.white)
                        }
                    )
            }
            
            
        } //closing Vstack
        
    }//closing someView
    
}//closing Exercise View

#Preview {
    ExerciseView()
}
