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
        HStack {
            Image(systemName:"person.fill").aspectRatio(contentMode: .fill)
            
            VStack(alignment:.leading) {
                Text("\(workouts[workoutNumberSelection].instructorName)").font(.title)
                Text("\(workouts[workoutNumberSelection].title)").foregroundColor(.gray)
                Text("\(workouts[workoutNumberSelection].caloriesBurned) calories burned")
                    .foregroundColor(.gray)
                
            }
        }
    }

}


struct WorkoutRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRowView(workouts: .constant(Workouts()))
    }
}
