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
        
        VStack {
            Text("Most Recent Workout").font(.largeTitle)
            Text("You burned a total of / calories")
        }.onChange(of: workouts) { value in
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

            let cadence = "\(workouts[316].avgCadenceRPM)"
            let output = "\(workouts[316].totalOutput)"
            print(workouts[316].workoutTimestamp)
            print("Your Instructor for this ride was \(workouts[316].instructorName)")
            print("You generated a total of \(output.replacingOccurrences(of: "integer", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")) kiloJoules during this ride")
            print("You burned a total of \(workouts[316].caloriesBurned) calories")
            
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
        ContentView()
    }
}
