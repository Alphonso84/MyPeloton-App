//
//  WorkoutChartView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 8/6/20.
//

import SwiftUI

struct WorkoutChartView: View {
    @State var pickerSelectedItem = 0
    var workouts: Workouts
    var body: some View {
        ZStack {
            
            VStack {
                Text("Weekly Calories")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Picker(selection: $pickerSelectedItem, label: Text(""), content: /*@START_MENU_TOKEN@*/{
                    Text("All").tag(0)
                    Text("15 min").tag(1)
                    Text("20 min").tag(2)
                    Text("30 min").tag(3)
                    Text("45 min").tag(4)
                    Text("60 min").tag(5)
                    Text("90 min").tag(6)
                }/*@END_MENU_TOKEN@*/)
                .pickerStyle(SegmentedPickerStyle())
                
                HStack (spacing:10) {
                    WorkoutBarView(text: "15", totalWorkout:CGFloat(workouts.count), numOfWorkout: 45)
                    WorkoutBarView(text: "20", totalWorkout: CGFloat(workouts.count), numOfWorkout: 120)
                    WorkoutBarView(text: "30", totalWorkout: CGFloat(workouts.count), numOfWorkout: 60)
                    WorkoutBarView(text: "45", totalWorkout: CGFloat(workouts.count), numOfWorkout: 174)
                    WorkoutBarView(text: "60", totalWorkout: CGFloat(workouts.count), numOfWorkout: 190)
                    WorkoutBarView(text: "90", totalWorkout: CGFloat(workouts.count), numOfWorkout: 35)
                    WorkoutBarView(text: "S", totalWorkout: CGFloat(workouts.count), numOfWorkout: 90)
                  
                }
                .animation(.default)
            }
        }
    }
}

struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutChartView(workouts: Workouts())
    }
}
