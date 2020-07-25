//
//  WorkoutRowView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 7/25/20.
//

import Foundation
import SwiftUI


struct WorkoutRowView: View {
    @State var workouts = Workouts()
    var body: some View {
        HStack {
            Image(systemName:"person.fill").aspectRatio(contentMode: .fill)
            
            VStack(alignment:.leading) {
                Text("Instructor Name").font(.title)
                Text("Class Name").foregroundColor(.gray)
                
            }
        }
    }
}

struct WorkoutRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRowView()
    }
}
