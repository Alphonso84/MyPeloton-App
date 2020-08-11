//
//  PersonalBestView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 8/7/20.
//

import SwiftUI

struct PersonalBestView: View {
    var instructorName = String()
    var classTitle = String()
    var totalOutput = Int()
    var date = String()
    var formattedDate: Date?
    let dateFormatter = DateFormatter()
    var body: some View {
        VStack {
        Text("Personal Best Workout")
            .font(.title)
            .fontWeight(.heavy)
            Image("\(instructorName)")
                .resizable().frame(width: 60, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
            Text("\(classTitle)")
            Text("\(totalOutput) Total Output")
            Text("Date: \(date)")
                .foregroundColor(.blue)
        }
    }
}

struct PersonalBestView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalBestView()
    }
}
