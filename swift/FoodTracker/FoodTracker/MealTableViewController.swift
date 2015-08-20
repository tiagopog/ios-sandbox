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
    super.viewDidLoad()
    loadSampleMeals()
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
    // #warning Incomplete implementation, return the number of sections
    return 0
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 0
  }
  
  /*
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
  
  // Configure the cell...
  
  return cell
  }
  */
  
  /*
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return false if you do not want the specified item to be editable.
  return true
  }
  */
  
  /*
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
  if editingStyle == .Delete {
  // Delete the row from the data source
  tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
  } else if editingStyle == .Insert {
  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
  }
  */
  
  /*
  // Override to support rearranging the table view.
  override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
  
  }
  */
  
  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return false if you do not want the item to be re-orderable.
  return true
  }
  */
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
