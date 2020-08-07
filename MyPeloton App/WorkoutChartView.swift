//
//  WorkoutChartView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 8/6/20.
//

import SwiftUI

struct WorkoutChartView: View {
    @State var pickerSelectedItem = 0
    var body: some View {
        ZStack {
            
            VStack {
                Text("Workout Stats")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                HStack {
                    ZStack {
                        Capsule().frame(width: 30, height: 300)
                        Capsule().frame(width: 30, height: 100)
                        foregroundColor(.red)
                    }
                }
                
            }
        }
    }
}

struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutChartView()
    }
}
