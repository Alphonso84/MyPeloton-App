//
//  WorkoutRowView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 7/25/20.
//

import Foundation
import SwiftUI


struct WorkoutRowView: View {
    
    @Binding var workouts: Workouts
    var workoutNumberSelection = 347
    var body: some View {
        
        List(workouts, id: \.workoutTimestamp) { workout in
        HStack {
            Image("\(workout.instructorName)").resizable().frame(width: 50, height: 70)
            
            VStack(alignment:.leading) {
                Text("\(workout.instructorName)").font(.title)
                Text("\(workout.fitnessDiscipline.rawValue)").foregroundColor(.gray)
                Text("\(workout.title)").foregroundColor(.gray)
                Text("\(workout.caloriesBurned) calories burned").foregroundColor(.gray)
                Text("\(workout.workoutTimestamp)")
                    .foregroundColor(.blue)
                
            }
        }
     }
  }
}


struct WorkoutRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRowView(workouts: .constant(Workouts()))
    }
}
