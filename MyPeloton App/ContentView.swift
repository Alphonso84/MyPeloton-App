//
//  ContentView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 7/25/20.
//

import SwiftUI

struct ContentView: View {
    @State var workouts = Workouts()
    var body: some View {
        
        NavigationView {
            List(workouts, id: \.workoutTimestamp) { workout in
                ZStack(alignment: .leading) {
                    HStack {
                        Image("\(workoutImage(instructorName: workout.instructorName))")
                            .resizable()
                            .frame(width: 59, height: 70)
                            .cornerRadius(25)
                        VStack(alignment:.leading) {
                            Text("\(workout.instructorName)")
                                .font(.title)
                            Text("\(workout.fitnessDiscipline.rawValue)")
                                .foregroundColor(.gray)
                            Text("\(workout.title)")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text("\(workout.workoutTimestamp)")
                                .foregroundColor(.blue)
                                .font(.subheadline)
                        }
                        .navigationBarTitle("Peloton Workouts", displayMode: .inline)
                    }
                    
                    NavigationLink(
                        destination: WorkoutChartView(),
                        label: {})
                }
            }
            
        }.onAppear(perform: {
            decodeJSON()
        })
    }
    
    
    func workoutImage(instructorName:String) ->String {
        var imageString = String()
        if instructorName.isEmpty {
            imageString = "Peloton"
        } else {
            imageString = instructorName
        }
        return imageString
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
    }
}
