 //
//  AddEntryViewController.swift


import UIKit

protocol WorkoutProtocol{
    func addNewWorkout(workout: FISWorkout)
    func cancel()
    
}
protocol ExerciseProtocol {
    func addNewExercise(exercise: FISExercise)
    func cancel()
}


class AddEntryViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var exerciseTableView: UITableView!
    @IBOutlet weak var numberOfSetsTextField: UITextField!
    @IBOutlet weak var numberOfRepsTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    var exercises = [FISExercise]()
    
    var delegate:WorkoutProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.numberOfSetsTextField.delegate = self
        self.numberOfRepsTextField.delegate = self
        self.numberOfStudentsTextField.delegate = self
        self.exerciseTableView.delegate = self
        self.exerciseTableView.dataSource = self
        
    
        self.setupExerciseList()
        self.exerciseTableView.reloadData()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    @IBAction func saveWorkoutTapped(sender: AnyObject) {
        var date = self.datePicker.date
        var exercise = self.exercises[self.exerciseTableView.indexPathForSelectedRow!.row]
        var workout = FISWorkout(timestamp: self.datePicker.date, reps: Int(self.numberOfRepsTextField.text!)!, sets: Int(self.numberOfSetsTextField.text!)!, numberOfWorkoutBuddies: Int(self.numberOfStudentsTextField.text!)!, exercise: exercise)
        
        if let delegate = self.delegate {
            delegate.addNewWorkout(workout)
            delegate.cancel()
        }else{
            print("doesn't exist")
        }
    }
    

    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setupExerciseList(){
        let pushups = FISExercise(name: "Pushups")
        pushups.muscleGroups = ["Pectorals", "Latissimus Dorsi"]
        let situps = FISExercise(name: "Situps")
        situps.muscleGroups = ["Abs"]
        let pullups = FISExercise(name: "Pullups")
        pullups.muscleGroups = ["Arms", "Back"]
        self.exercises.append(pushups)
        self.exercises.append(situps)
        self.exercises.append(pullups)
 
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "exerciseCell"

        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        let exercise = self.exercises[indexPath.row]
        cell.textLabel!.text = exercise.name
        
        
        return cell
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exercises.count
    }
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
   
}
