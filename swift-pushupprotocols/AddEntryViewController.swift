 //
//  AddEntryViewController.swift


import UIKit


class AddEntryViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var exerciseTableView: UITableView!
    @IBOutlet weak var numberOfSetsTextField: UITextField!
    @IBOutlet weak var numberOfRepsTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    var exercises = [FISExercise]()
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "exerciseCell"

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let exercise = self.exercises[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = exercise.name
        
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exercises.count
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
   
}
