//
//  ContentView.swift
//  OurFitnessPal
//
//  Created by Janev, Christian (514673) on 4/9/25.
//

import SwiftUI

struct ContentView: View {
    // nutritionix
    // cloudkit
    var body: some View {
        
        VStack(){
            
            //Main Title
            Text("OurFitenssPal")
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
                
                Text("Protien")
                
                Text("Carbs")
                
                Text("Fats")


                
                
                
                
            }
            
            
        }

        
    }
}

#Preview {
    ContentView()
}
