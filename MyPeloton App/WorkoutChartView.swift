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
        Text("Calories Burned")
            .font(.largeTitle)
            .fontWeight(.heavy)
            
           
        }
    }
}

struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutChartView()
    }
}
