//
//  WorkoutChartView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 8/6/20.
//

import SwiftUI

struct WorkoutChartView: View {
   // @State var pickerSelectedItem = 0
    var body: some View {
        ZStack {
            
            VStack {
                Text("Weekly Calories")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                HStack (spacing:10) {
                    BarView(text: "S", value: 45)
                    BarView(text: "M", value: 120)
                    BarView(text: "T", value: 60)
                    BarView(text: "W", value: 174)
                    BarView(text: "T", value: 190)
                    BarView(text: "F", value: 35)
                    BarView(text: "S", value: 90)
                  
                }
                
            }
        }
    }
}

struct BarView: View {
    var text: String
    var value: CGFloat
    var body: some View {
        VStack {
            
        ZStack(alignment:.bottom) {
            Capsule().frame(width: 0, height: 200)
                .foregroundColor(.secondary)
            
            Capsule().frame(width: 30, height: value)
                .foregroundColor(.red)
        }
            Text("\(text)")
        }
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutChartView()
    }
}
