//
//  WorkoutBarView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 8/7/20.
//

import SwiftUI

struct WorkoutBarView: View {
    var text: String
    var totalWorkout: CGFloat
    var numOfWorkout: CGFloat
    var body: some View {
        VStack {
            
        ZStack(alignment:.bottom) {
            Capsule().frame(width: 30, height: totalWorkout)
                .foregroundColor(.secondary)
            
            Capsule().frame(width: 30, height: numOfWorkout)
                .foregroundColor(.red)
        }
            Text("\(text)")
        }
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}


struct WorkoutBarView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutBarView(text: "", totalWorkout: 1, numOfWorkout: 1)
    }
}
