//
//  ContentView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 7/25/20.
//

import SwiftUI

struct ContentView: View {
    @State var workouts = Workouts()
    @State var pickerViewChooser = Int()
    @State var pickerSelectedItem = Int()
    @State var firstPickerSelection = Int()
    var body: some View {
        
        NavigationView {
            VStack {
                
                Picker(selection: $pickerViewChooser, label: Text(""), content:
                /*@START_MENU_TOKEN@*/{
                    Text("Chart View").tag(0)
                    Text("Personal Best View").tag(1)
                }/*@END_MENU_TOKEN@*/)
                    .pickerStyle(SegmentedPickerStyle())
                
                if pickerViewChooser == 0 {
                    WorkoutChartView(workouts: workouts) .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                } else {
                PersonalBestView(instructorName: getBestWorkOutFromArray(array: workouts).0, classTitle: getBestWorkOutTitleDateFromArray(array: workouts).1, totalOutput: getBestWorkOutFromArray(array: workouts).1, date: getBestWorkOutTitleDateFromArray(array: workouts).0)
                }
                
                Picker(selection: $pickerSelectedItem, label: Text(""), content: /*@START_MENU_TOKEN@*/{
                    Text("All").tag(0)
                    Text("15 min").tag(1)
                    Text("20 min").tag(2)
                    Text("30 min").tag(3)
                    Text("45 min").tag(4)
                    Text("60 min").tag(5)
                    Text("90 min").tag(6)
                }/*@END_MENU_TOKEN@*/)
                .onChange(of: pickerSelectedItem) { value in
                    workouts = getWorkoutArrayForTime(pickerSelection:pickerSelectedItem)
                }
                .padding(.top, 10)
                .pickerStyle(SegmentedPickerStyle())
               
                WorkoutRowView(workouts: workouts)
                    .navigationBarTitle("\(navigationBarTitleString())", displayMode:.inline)
                    .navigationBarItems(leading: Image("Peloton")
                                            .resizable()
                                            .cornerRadius(15)
                                            .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                
                
            }.onAppear(perform: {
                decodeJSON()
                workouts = getWorkoutArrayForTime(pickerSelection: pickerSelectedItem)
            })
        }
    }
    
    //MARK: NavigationBarTitle String Method
    
    func navigationBarTitleString() -> String {
        var titleString = "All Workouts"
        if  pickerSelectedItem == 0 {
            titleString = "All Workouts"
        }
        if pickerSelectedItem == 1 {
            titleString = "15 Min Workouts"
        }
        if  pickerSelectedItem == 2 {
            titleString = "20 Min Workouts"
        }
        if  pickerSelectedItem == 3 {
            titleString = "30 Min Workouts"
        }
        if  pickerSelectedItem == 4 {
            titleString = "45 Min Workouts"
        }
        if  pickerSelectedItem == 5 {
            titleString = "60 Min Workouts"
        }
        if  pickerSelectedItem == 6 {
            titleString = "90 Min Workouts"
        }
        return titleString
    }
    
    //MARK: Workout Filter Methods
    
     func getBestWorkOutTitleDateFromArray(array:Workouts) -> (String,String)  {
        var bestWorkoutDateTitle = ("","")
        var bestWorkoutInfo = Int()
        
        for singleWorkout in array {
            if singleWorkout.totalOutput > bestWorkoutInfo {
                bestWorkoutInfo = singleWorkout.totalOutput
                bestWorkoutDateTitle.0 = singleWorkout.workoutTimestamp
                bestWorkoutDateTitle.1 = singleWorkout.title
            }
        }
        return bestWorkoutDateTitle
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
    
    func getWorkoutArrayForTime(pickerSelection: Int) -> Workouts {
        workouts.removeAll()
        decodeJSON()
        var newWorkoutArray = Workouts()
        
        for workout in workouts {
            if  pickerSelectedItem == 0 && workout.totalOutput > 50 && !workout.title.contains("Low Impact") && !workout.title.contains("Cool Down") && !workout.title.contains("Warm Up") && !workout.title.contains("Just Ride") && !workout.title.contains("Scenic Ride") {
                newWorkoutArray.append(workout)
                
            }
            if  pickerSelectedItem == 1 && workout.title.contains("15 min") && !workout.title.contains("Low Impact") && !workout.title.contains("Cool Down") && !workout.title.contains("Warm Up") && !workout.title.contains("Just Ride") && !workout.title.contains("Scenic Ride") && workout.totalOutput > 50  {
                newWorkoutArray.append(workout)
                
            }
            if  pickerSelectedItem == 2 && workout.title.contains("20 min") && !workout.title.contains("Low Impact") && !workout.title.contains("Cool Down") && !workout.title.contains("Warm Up") && !workout.title.contains("Just Ride") && !workout.title.contains("Scenic Ride") && workout.totalOutput > 50  {
                newWorkoutArray.append(workout)
                
            }
            if  pickerSelectedItem == 3 && workout.title.contains("30 min") && !workout.title.contains("Low Impact") && !workout.title.contains("Cool Down") && !workout.title.contains("Warm Up") && !workout.title.contains("Just Ride") && !workout.title.contains("Scenic Ride") && workout.totalOutput > 50  {
                newWorkoutArray.append(workout)
                
            }
            if  pickerSelectedItem == 4 && workout.title.contains("45 min") && !workout.title.contains("Low Impact") && !workout.title.contains("Cool Down") && !workout.title.contains("Warm Up") && !workout.title.contains("Just Ride") && !workout.title.contains("Scenic Ride") && workout.totalOutput > 50   {
                newWorkoutArray.append(workout)
                
            }
            if  pickerSelectedItem == 5 && workout.title.contains("60 min") && !workout.title.contains("Low Impact") && !workout.title.contains("Cool Down") && !workout.title.contains("Warm Up") && !workout.title.contains("Just Ride") && !workout.title.contains("Scenic Ride") && workout.totalOutput > 50  {
                newWorkoutArray.append(workout)
                
            }
            if  pickerSelectedItem == 6 && workout.title.contains("90 min") && !workout.title.contains("Low Impact") && !workout.title.contains("Cool Down") && !workout.title.contains("Warm Up") && !workout.title.contains("Just Ride") && !workout.title.contains("Scenic Ride") && workout.totalOutput > 50  {
                newWorkoutArray.append(workout)
                
            }
        }
        return newWorkoutArray
    }
    
    
    // MARK: Parse JSON Data into Model Object
    func decodeJSON() {
        guard let workoutData = readLocalFile(forName: "WorkoutData") else { return }
        
        do {
            let jsonDecoder = JSONDecoder()
            let jsonData = try  jsonDecoder.decode(Workouts.self, from: workoutData)
            
            
            workouts = jsonData
            print(jsonData)
        } catch {
            print(error)
        }
    }
    
    // MARK: Read Downloaded File And Return Data
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}
