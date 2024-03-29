//
//  WorkoutChartView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 8/6/20.
//

import SwiftUI
import Charts

struct WorkoutChartView: View {
    var workouts: Workouts
    var body: some View {
        VStack {
            Text("Output")
            ScrollView(.horizontal){
                HStack  {
                    ForEach(workouts, id:\.totalOutput) { workout in
                        Chart {
                            BarMark(x: .value("Name", "Workout"),y: .value("Time",1))
                            BarMark(x: .value("Name", "Workout 2"),y: .value("Time",5))
                        }
                        
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
            
            if singleWorkout.totalOutput ?? 0 > bestWorkoutInfo.1 {
                bestWorkoutInfo.1 = singleWorkout.totalOutput ?? 0
                bestWorkoutInfo.0 = singleWorkout.instructorName ?? ""
            }
        }
        return bestWorkoutInfo
    }
}


struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutChartView(workouts: Workouts()).previewDevice("iPhone 11 Pro")
    }
}
