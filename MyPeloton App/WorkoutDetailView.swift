//
//  WorkoutDetailView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 8/7/20.
//

import SwiftUI

struct WorkoutDetailView: View {
    @State var workout: Workout
    var body: some View {
        VStack {
            Image("\(workout.instructorName)")
                .resizable()
                .frame(width: 150, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//            Text("Average Resistance \(workout.avgResistance)")
//            Text("Calories Burned \(workout.caloriesBurned!)")
//            Text("Total Output \(workout.totalOutput)")
        }
        
    }
}

//
//struct WorkoutDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutDetailView()
//    }
//}
