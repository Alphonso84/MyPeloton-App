//
//  ContentView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 7/25/20.
//

import SwiftUI

struct ContentView: View {
    @State var workouts = Workouts()
    @State var pickerSelectedItem = Int()
    var body: some View {
        
        NavigationView {
            VStack {
                Picker(selection: $pickerSelectedItem, label: Text(""), content: /*@START_MENU_TOKEN@*/{
                    Text("All").tag(0)
                    Text("20 min").tag(1)
                    Text("30 min").tag(2)
                    Text("45 min").tag(3)
                    Text("60 min").tag(4)
                    Text("90 min").tag(5)
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
        if  pickerSelectedItem == 1 {
            titleString = "20 Min Workouts"
        }
        if  pickerSelectedItem == 2 {
            titleString = "30 Min Workouts"
        }
        if  pickerSelectedItem == 3 {
            titleString = "45 Min Workouts"
        }
        if  pickerSelectedItem == 4 {
            titleString = "60 Min Workouts"
        }
        if  pickerSelectedItem == 5 {
            titleString = "90 Min Workouts"
        }
        return titleString
    }
   
    //MARK: Workout Filter Methods
    
    func getWorkoutArrayForTime(pickerSelection: Int) -> Workouts {
        workouts.removeAll()
        decodeJSON()
        var newWorkoutArray = Workouts()
        
        for workout in workouts {
            if  pickerSelectedItem == 0 {
                newWorkoutArray.append(workout)
               
            }
            if  pickerSelectedItem == 1 && workout.title.contains("20 min") {
                newWorkoutArray.append(workout)
                
            }
            if  pickerSelectedItem == 2 && workout.title.contains("30 min")  {
                newWorkoutArray.append(workout)
                
            }
            if  pickerSelectedItem == 3 && workout.title.contains("45 min")  {
                newWorkoutArray.append(workout)
                
            }
            if  pickerSelectedItem == 4 && workout.title.contains("60 min")  {
                newWorkoutArray.append(workout)
                
            }
            if  pickerSelectedItem == 5 && workout.title.contains("90 min")  {
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
