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
            VStack {
                NavigationLink(
                    destination: WorkoutRowView(workouts: $workouts),
                    label: {
                        Text("Get Peloton WorkOut Data")
                    }).onAppear {
                        decodeJSON()
                }
            }
        }
    }
    
    
// MARK: Parse JSON Data into Model Object
    func decodeJSON() {
        
        guard let workoutData = readLocalFile(forName: "WorkoutData") else { return }
        
        do {
            let jsonDecoder = JSONDecoder()
            let jsonData = try  jsonDecoder.decode(Workouts.self, from: workoutData)
            workouts = jsonData
            //Last Workout is always CoolDown
//            let mostRecentWorkout = workouts[workouts.count - 2]
//            let firstWorkout = workouts.first
//
//            let cadence = "\(mostRecentWorkout.avgCadenceRPM)"
//            let output = "\(mostRecentWorkout.totalOutput)"
//            print("Your very first workout was \(firstWorkout?.title)")
//            print("You took this course on \(mostRecentWorkout.workoutTimestamp)")
//
//            print("Your Instructor for this ride was \(mostRecentWorkout.instructorName)")
//            print("You generated a total of \(output.replacingOccurrences(of: "integer", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")) kiloJoules during this ride")
//            print("You burned a total of \(mostRecentWorkout.caloriesBurned) calories")
//
//            print("You sustained a cadence of \(cadence.replacingOccurrences(of: "integer", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")) RPM During this ride")
//
//
        } catch {
          print(error)
        }
    }

// MARK: Read Downloaded File And Return Data
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
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
