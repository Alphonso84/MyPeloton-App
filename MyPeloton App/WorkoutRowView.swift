////
////  WorkoutRowView.swift
////  MyPeloton App
////
////  Created by Alphonso Sensley II on 7/25/20.
////

import Foundation
import SwiftUI


struct WorkoutRowView: View {
    
    var workouts: Workouts
    var body: some View {
        
        List(workouts, id: \.workoutTimestamp) { workout in
            ZStack(alignment: .leading) {
                HStack {
                    Image("\(getWorkoutImage(instructorName: workout.instructorName ?? ""))")
                        .resizable()
                        .frame(width: 59, height: 70)
                        .cornerRadius(40)
                    VStack(alignment:.leading) {
                        Text("\(getWorkoutInstructorName(name:workout.instructorName ?? ""))")
                            .font(.title)
                        Text("\(workout.fitnessDiscipline.rawValue)")
                            .foregroundColor(.gray)
                        Text("\(getWorkoutTitle(title: workout.title ?? ""))")
                            .foregroundColor(.gray)
                            .font(.subheadline)
//                        Text("Total Output \(workout.totalOutput)")
                        Text("\(getWorkoutTimeStamp(timeStamp: workout.workoutTimestamp ?? ""))")
                            .foregroundColor(.blue)
                            .font(.subheadline)
                    }
                }
                NavigationLink(
                    destination: WorkoutDetailView(workout: workout),
                    label: {})
            }
        }
    }
    //MARK: String Validation Methods
    
    func getWorkoutImage(instructorName:String) ->String {
        var imageString = String()
        if instructorName.isEmpty || instructorName == "Denis & Matt" {
            imageString = "Peloton"
        } else {
            imageString = instructorName
        }
        return imageString
    }
    
    func getWorkoutInstructorName(name:String) ->String {
        var nameString = String()
        if name.isEmpty {
            nameString = "Scenic Ride"
        } else {
            nameString = name
        }
        return nameString
    }
    
    func getWorkoutTitle(title:String) ->String {
        var titleString = String()
        if title.isEmpty {
            titleString = "Unknown Workout"
        } else {
            titleString = title
        }
        return titleString
    }
    
    func getWorkoutTimeStamp(timeStamp:String) ->String {
        var timeStampString = String()
        if timeStamp.isEmpty {
            timeStampString = "Unknown Time"
        } else {
            timeStampString = timeStamp
        }
        return timeStampString
    }
}
  
struct WorkoutRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRowView(workouts: Workouts())
    }
}
