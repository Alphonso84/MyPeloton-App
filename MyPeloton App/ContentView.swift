//
//  ContentView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 7/25/20.
//

import SwiftUI

struct ContentView: View {
    @State var workouts = Workouts()
    @Binding var myWorkouts: Workouts
    
    var body: some View {
        NavigationView {
        VStack {
            Text("Most Recent Workout").font(.largeTitle)
            Text("You burned a total of \(myWorkouts[299].caloriesBurned) calories")
         }
        }.onAppear {
            decodeJSON()
        }
    }
    
// MARK: Parse JSON Data into Model Object
    func decodeJSON() {
        
        guard let workoutData = readLocalFile(forName: "WorkoutData") else { return }
        
        do {
            let jsonDecoder = JSONDecoder()
            let jsonData = try  jsonDecoder.decode(Workouts.self, from: workoutData)
            workouts = jsonData

            let cadence = "\(jsonData[318].avgCadenceRPM)"
            let output = "\(jsonData[318].totalOutput)"
            print("You took this course on \(jsonData[318].workoutTimestamp)")
            print("Your Instructor for this ride was \(jsonData[318].instructorName)")
            print("You generated a total of \(output.replacingOccurrences(of: "integer", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")) kiloJoules during this ride")
            print("You burned a total of \(jsonData[318].caloriesBurned) calories")
            
            print("You sustained a cadence of \(cadence.replacingOccurrences(of: "integer", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")) RPM During this ride")
           
           
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
        ContentView(myWorkouts: .constant(Workouts()))
    }
}
