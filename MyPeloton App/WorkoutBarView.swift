//
//  WorkoutBarView.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 8/7/20.
//

import SwiftUI

var barWasTapped = Bool()

struct WorkoutBarView: View {
    var text: String
    var maxWorkoutOutput: CGFloat
    var workoutOutput: CGFloat
    var workoutDate: String
   
    var body: some View {
        VStack{
            ZStack(alignment:.bottom) {
                if barWasTapped {
                    Text("\(showClassOutputAndDate())")
                }
                Capsule().frame(width: 30, height:200)
                    .foregroundColor(.secondary)
                Capsule().frame(width: 30, height:barViewScaledHeightFor(outPut: CGFloat(workoutOutput)))
                    .foregroundColor(.red)
                    .animation((Animation.default))
            }
            .shadow(radius: 5)
            Text("\(text)")
        }.onTapGesture {
            barWasTapped.toggle()
            print("\(workoutDate)")
        }
    }
    
    func showClassOutputAndDate() -> Text{
        
        return Text("\(workoutDate)")
    }
    
    //This method is used to scale the output to fit into Bar height of 200pts. 200pts = 1200 Output.
    func barViewScaledHeightFor(outPut:CGFloat) ->CGFloat{
        var height = CGFloat()
        height =  outPut * 0.15384615
        return height
    }
}


struct WorkoutBarView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutBarView(text:"",maxWorkoutOutput: 1, workoutOutput: 1, workoutDate: "")
    }
}
