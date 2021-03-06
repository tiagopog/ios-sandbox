//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Tiago Guedes on 8/20/15.
//  Copyright © 2015 Tiago Guedes. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
  // MARK: Properties
  var meals = [Meal]()

  override func viewDidLoad() {
    navigationItem.leftBarButtonItem = editButtonItem()
    super.viewDidLoad()
    //if let savedMeals = loadMeals() {
    //  meals += savedMeals
    //} else {
      // Load sample data.
      loadSampleMeals()
    //}
  }
  
  func loadSampleMeals() {
    let photo1 = UIImage(named: "meal1.jpg")!
    let meal1 = Meal(name: "Salada Fodona", photo: photo1, rating: 4)!
    
    let photo2 = UIImage(named: "meal2.jpg")!
    let meal2 = Meal(name: "Frango com Batata", photo: photo2, rating: 3)!
    
    let photo3 = UIImage(named: "meal3.jpg")!
    let meal3 = Meal(name: "Macarrão com Bolinho de Carne", photo: photo3, rating: 5)!
    
    meals += [meal1, meal2, meal3]
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return meals.count
  }
  

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    // Table view cells are reused and should be dequeued using a cell identifier.
    let cellIdentifier = "MealTableViewCell"
    
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell

    // Fetches the appropriate meal for the data source layout.
    let meal = meals[indexPath.row]
    
    cell.nameLabel.text = meal.name
    cell.photoImageView.image = meal.photo
    cell.ratingControl.rating = meal.rating
    
    return cell
  }
  
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      meals.removeAtIndex(indexPath.row)
      saveMeals()
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle  == .Insert {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
  }
  
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }
  
  @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
    if let sourceViewController = sender.sourceViewController as?
      MealViewController, meal = sourceViewController.meal {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
          // Update an existing meal.
          meals[selectedIndexPath.row] = meal
          tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
        } else {
          // Add a new meal.
          let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
          meals.append(meal)
          tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
        }
        // Persist the meals.
        saveMeals()
    }
  }
  
  // MARK: - Navigation
  
  // In a storyboard-based application, it's a good idea to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetail" {
      print("Edit meal.")
      let mealDetailViewController = segue.destinationViewController as!
        MealViewController
      
      if let selectedMealCell = sender as? MealTableViewCell {
        let indexPath = tableView.indexPathForCell(selectedMealCell)!
        let selectedMeal = meals[indexPath.row]
        mealDetailViewController.meal = selectedMeal
      }
      
    }
    else if segue.identifier == "AddItem" {
      print("Adding new meal.")
    }
  }
  
  // MARK: NSCoding
  
  func saveMeals() {
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path!)
    if !isSuccessfulSave {
      print("Failed to save meals...")
    }
  }
  
  func loadMeals() -> [Meal]? {
    return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURL.path!) as? [Meal]
  }
}
