Pushup Protocols
=======

### Goals 
- Send data back through an app using custom protocols with delegates. 
- Get some practice with reading other people's code

### Objective 

**A fellow programmer has written an exercise tracker, but it isn't quite finished. Let's make it work.**

## Instructions

* Run the app. You will be presented with a screen listing the # of Sets, Reps, Flatironers, etc. If you click the '+' button in the navigation bar, a new screen appears!
* This second view allows you to enter in the Number of reps, sets & Flatironers participating. But.. you'll notice that if you go to hit the "Save Workout" button in the lower-right side, nothing happens. This is where **you** come in!
* Lets call our first View Controller A and our second View Controller B.  
As it stands we have A --> B relationship in that we could send info forward in the `prepareForSegue(_:sender:)` method. But how can we go from B --> A? There are multiple ways to do this, for this lab you will implement this B --> A through the use of **Protocols** & **Delegates**. 

- Add a custom protocol and delegate to get stats for a new exercise log entry to the `StatsViewController` (A) from the `AddEntryViewController` (B).
* In the `prepareForSegue(_:sender:)` method on the `StatsViewController` (A), we need to establish a connection to the `AddEntryViewController` (B) - how can we do that? Hint: Think of this as a parent-child relationship, if (A) is the parent looking to respond to (B) crying out, (A) needs to be the delegate of (B).

- Attach the `UIButtons` from our storyboard to their associated controllers for use as `IBAction`s, and then write the code to make them work.

- No tests for this one,  but if you want to do it correctly, you will not use unwind segues, NSNotificationCenter, or blocks to pass data around (to the extent you are already familiar with some or all of these methods.) You will also not have any singleton objects in your program.

## Hints

- There are a couple of errors that the fellow programmer has left in the program that you may want to deal with along the way that have nothing to do with custom delegate / protocols. However, none of them are required to be fixed to make the program work under "ideal" conditions.

- Also, don't forget to take a look at how the methods to get the statistics work! 
<p data-visibility='hidden'>View <a href='https://learn.co/lessons/swift-PushupProtocols' title='Pushup Protocols'>Pushup Protocols</a> on Learn.co and start learning to code for free.</p>
