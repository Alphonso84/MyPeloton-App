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
                HStack (spacing:spacingForArraySize(array: workouts)) {
                    ForEach(workouts, id:\.totalOutput) { workout in
                        WorkoutBarView(text:String(workout.totalOutput),maxWorkoutOutput:CGFloat(getBestWorkOutFromArray(array: workouts).1), workoutOutput:CGFloat(workout.totalOutput), workoutDate:String(workout.workoutTimestamp))
                        
                    }
                }
            }
        }
    }
    
    
    func spacingForArraySize(array:Workouts) -> CGFloat {
        var spacing = Int()
        let arraySize = array.count
        
        if arraySize < 10 {
            spacing = Int(CGFloat(50))
        } else if arraySize < 20 {
            spacing = Int(CGFloat(10))
        } else {
            spacing = Int(CGFloat(3))
        }
        
        return CGFloat(spacing)
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


struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
