//
//  WorkoutBarView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 8/7/20.
//

import SwiftUI

struct WorkoutBarView: View {
    var text: String
    var maxWorkoutOutput: CGFloat
    var workoutOutput: CGFloat
   
    var body: some View {
        VStack{
            
            ZStack(alignment:.bottom) {
                Capsule().frame(width: 30, height: maxWorkoutOutput)
                    .foregroundColor(.secondary)
                
                Capsule().frame(width: 30, height: workoutOutput)
                    
                    .foregroundColor(.red)
            }
            .animation((Animation.easeIn(duration: 0.5).delay(0)).delay(0))
            .shadow(radius: 5)
            Text("\(text)")
        }
    }
}


struct WorkoutBarView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutBarView(text:"",maxWorkoutOutput: 1, workoutOutput: 1)
    }
}
