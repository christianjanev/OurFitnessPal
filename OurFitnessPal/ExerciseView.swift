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
            Text("Mycros")
                .font(.system(size: 40))
                .frame(width: 700, height: 60)
//                        .background(Color.green)
                
            Divider()
            
            Text("Weight Loss")
                .frame(width: 200, height: 40)
                .offset(x: -95, y: 0)
                .font(.system(size: 20))
            
            ZStack(){

                Image("weightHealth")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 125)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .opacity(0.6)
                
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black)
                    .frame(width: 300, height: 125)
                
                
                Text("Muscle Gain")
                    .frame(width: 300, height: 30)
                    .background(Color(.green))
                    .offset(x: 0, y: 47)
                    .font(.system(size: 20))
            }//closing z
            
            Text("Muscle Gain")
                .frame(width: 200, height: 40)
                .offset(x: -95, y: 0)
                .font(.system(size: 20))
            
            ZStack(){

                Image("muscleHealth")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 125)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .opacity(0.6)
                
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black)
                    .frame(width: 300, height: 125)
                
                
                Text("Muscle Gain")
                    .frame(width: 300, height: 30)
                    .background(Color(.green))
                    .offset(x: 0, y: 47)
                    .font(.system(size: 20))
            }//closing z



            
            Text("Heart Healthy")
                .frame(width: 200, height: 40)
                .offset(x: -95, y: 0)
                .font(.system(size: 20))
            
            ZStack(){

                Image("heartHealth")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 125)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .opacity(0.6)
                
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black)
                    .frame(width: 300, height: 125)
                
                
                Text("Heart Health")
                    .frame(width: 300, height: 30)
                    .background(Color(.green))
                    .offset(x: 0, y: 47)
                    .font(.system(size: 20))
            }//closing z

            
            Text("Gut Health")
                .frame(width: 200, height: 40)
                .offset(x: -95, y: 0)
                .font(.system(size: 20))
                .font(.system(size: 20))

            
            
            

            
            ZStack(){

                Image("gutHealth")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 125)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .opacity(0.6)
                
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black)
                    .frame(width: 300, height: 125)
                
                
                Text("Gut Health")
                    .multilineTextAlignment(.leading)
                    .frame(width: 300, height: 30)
                    .background(Color(.green))
                    .offset(x: 0, y: 47)
                    .font(.system(size: 20))
            }//closing z
            
            
            
            
            
        } //closing Vstack
        
    }//closing someView
    
}//closing Exercise View

#Preview {
    ExerciseView()
}
