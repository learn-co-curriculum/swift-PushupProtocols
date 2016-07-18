//
//  FISWorkout.swift


import Foundation

class FISWorkout {
    var timestamp: NSDate!
    var reps: Int
    var sets: Int
    var numberOfWorkoutBuddies:Int
    
    var computedData: NSDate!
    var exercise: FISExercise!
    
    init(timestamp: NSDate, reps: Int, sets: Int, numberOfWorkoutBuddies: Int, exercise: FISExercise ){
        self.timestamp = timestamp
        self.reps = reps
        self.sets = sets
        self.numberOfWorkoutBuddies = numberOfWorkoutBuddies
        self.exercise = exercise
        
    }
    
    
}


