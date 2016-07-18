//  StatsViewController.swift
import UIKit

class StatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, WorkoutProtocol {
    
    @IBOutlet weak var totalNumberOfRepsLabel: UILabel!
    @IBOutlet weak var totalNumberOfSetsLabel: UILabel!
    @IBOutlet weak var totalNumberOfFlatironersLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var allTimeNumberOfFlatironers: UILabel!
    @IBOutlet weak var allTimeReps: UILabel!
    @IBOutlet weak var tableView: UITableView!
    

    var workouts = [FISWorkout]()

  
    func addNewWorkout(workout: FISWorkout){
        self.workouts.append(workout)
        self.updateUI()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func cancel(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func updateUI(){
        var totalReps = 0
        var totalFlatironers = 0
        for work in self.workouts{
            totalReps += work.sets*work.reps
            totalFlatironers += work.numberOfWorkoutBuddies
        }
        self.allTimeReps.text = String(totalReps)
        self.allTimeNumberOfFlatironers.text = String(totalFlatironers)
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
      
        let totalReps = self.workouts[indexPath.row].sets*self.workouts[indexPath.row].reps
        cell.textLabel!.text = "\(self.workouts[indexPath.row].exercise.name) - \(totalReps) Reps"
        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.workouts.count
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        updateUIForWorkout(self.workouts[indexPath.row])
    }
    
    func updateUIForWorkout(workout:FISWorkout){
        self.totalNumberOfRepsLabel.text = String(workout.reps)
        self.totalNumberOfSetsLabel.text = String(workout.sets)
        self.totalNumberOfFlatironersLabel.text = String(workout.numberOfWorkoutBuddies)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        let strDate = dateFormatter.stringFromDate(workout.timestamp)
        self.dateLabel.text = strDate
    }


    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let addEntryViewController = segue.destinationViewController as? AddEntryViewController
        if let viewController = addEntryViewController {
            viewController.delegate = self
        }
    }
}
