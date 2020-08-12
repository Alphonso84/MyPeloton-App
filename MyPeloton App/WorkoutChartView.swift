//
//  WorkoutChartView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 8/6/20.
//

import SwiftUI

struct WorkoutChartView: View {
    var workouts: Workouts
    
    var body: some View {
        VStack {
            Text("Output")
        ScrollView(.horizontal){
            HStack (spacing:3) {
                    ForEach(workouts, id:\.totalOutput) { workout in
                        WorkoutBarView(text:String(workout.totalOutput),maxWorkoutOutput:CGFloat(getBestWorkOutFromArray(array: workouts).1) * 0.2, workoutOutput:CGFloat(workout.totalOutput) * 0.2)
                            
                }
                    .animation(.default)
            }
        }
        }
    }
    
    func getBestWorkOutFromArray(array:Workouts) -> (String,Int){
        var bestWorkoutInfo = ("",0)
        
        for singleWorkout in array {
            
            if singleWorkout.totalOutput > bestWorkoutInfo.1 {
                bestWorkoutInfo.1 = singleWorkout.totalOutput
                bestWorkoutInfo.0 = singleWorkout.instructorName
            }
        }
        return bestWorkoutInfo
    }
}



//struct WorkoutChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutChartView(workouts: Workouts())
//    }
//}

struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
