//
//  ContentView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 7/25/20.
//

import SwiftUI

struct ContentView: View {
    @State var workouts = Workouts()
    @State var pickerSelectedItem = 0
    var body: some View {
        
        NavigationView {
            VStack {
                Picker(selection: $pickerSelectedItem, label: Text(""), content: /*@START_MENU_TOKEN@*/{
                    Text("20 min").tag(0)
                    Text("30 min").tag(1)
                    Text("45 min").tag(2)
                    Text("60 min").tag(3)
                    Text("90 min").tag(4)
                }/*@END_MENU_TOKEN@*/)
                .padding(.top, 10)
                .pickerStyle(SegmentedPickerStyle())
                
                WorkoutRowView(workouts: workouts)
                    .navigationBarTitle("All Workouts", displayMode:.inline)
                    .navigationBarItems(leading: Image("Peloton")
                                            .resizable()
                                            .cornerRadius(15)
                                            .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
            }.onAppear(perform: {
                decodeJSON()
            })
        }
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
