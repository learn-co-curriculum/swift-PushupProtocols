//
//  FISWorkout.swift


import Foundation

class FISWorkout {
    var timestamp: Date!
    var reps: Int
    var sets: Int
    var numberOfWorkoutBuddies:Int
    
    var computedData: Date!
    var exercise: FISExercise!
    
    init(timestamp: Date, reps: Int, sets: Int, numberOfWorkoutBuddies: Int, exercise: FISExercise ){
        self.timestamp = timestamp
        self.reps = reps
        self.sets = sets
        self.numberOfWorkoutBuddies = numberOfWorkoutBuddies
        self.exercise = exercise
        
    }
    
    
}


