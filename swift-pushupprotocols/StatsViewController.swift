//  StatsViewController.swift
import UIKit

class StatsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var totalNumberOfRepsLabel: UILabel!
    @IBOutlet weak var totalNumberOfSetsLabel: UILabel!
    @IBOutlet weak var totalNumberOfFlatironersLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var allTimeNumberOfFlatironers: UILabel!
    @IBOutlet weak var allTimeReps: UILabel!
    @IBOutlet weak var tableView: UITableView!
    

    var workouts = [FISWorkout]()

    
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
        let totalReps = self.workouts[(indexPath as NSIndexPath).row].sets*self.workouts[(indexPath as NSIndexPath).row].reps
        cell.textLabel!.text = "\(self.workouts[(indexPath as NSIndexPath).row].exercise.name) - \(totalReps) Reps"
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.workouts.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateUIForWorkout(self.workouts[(indexPath as NSIndexPath).row])
    }
    
    func updateUIForWorkout(_ workout:FISWorkout){
        self.totalNumberOfRepsLabel.text = String(workout.reps)
        self.totalNumberOfSetsLabel.text = String(workout.sets)
        self.totalNumberOfFlatironersLabel.text = String(workout.numberOfWorkoutBuddies)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: workout.timestamp as Date)
        self.dateLabel.text = strDate
    }


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
