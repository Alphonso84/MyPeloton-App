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
        
        List(workouts, id: \.instructorName) { workout in
        HStack {
            Image(systemName:"person.fill").aspectRatio(contentMode: .fill)
            
            VStack(alignment:.leading) {
                Text("\(workout.instructorName)").font(.title)
                Text("\(workout.title)").foregroundColor(.gray)
                Text("\(workout.caloriesBurned) calories burned")
                    .foregroundColor(.gray)
                Text("\(workout.workoutTimestamp)")
                
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
