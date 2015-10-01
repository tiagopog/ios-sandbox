//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Tiago Guedes on 8/2/15.
//  Copyright © 2015 Tiago Guedes. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate,
  UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  // MARK: Properties
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  @IBOutlet weak var saveButton: UIBarButtonItem!
  
  /*
  This value is either passed by `MealTableViewController` in `prepareForSegue(_:sender:)`
  or constructed as part of adding a new meal.
  */
  var meal = Meal?()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Handle the text field’s user input through delegate callbacks.
    nameTextField.delegate = self
    
    if let meal = meal {
      navigationItem.title = meal.name
      nameTextField.text = meal.name
      photoImageView.image = meal.photo
      ratingControl.rating = meal.rating
    }

    checkValidMealName()
  }

  // MARK: UITextFieldDelegate
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    // Hide the keyboard.
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidBeginEditing(textField: UITextField) {
    // Disable the Save button while editing.
    saveButton.enabled = false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    checkValidMealName()
    navigationItem.title = textField.text
  }

  func checkValidMealName() {
    let text = nameTextField.text ?? ""
    saveButton.enabled = !text.isEmpty
  }
  
  // MARK: UIImagePickerControllerDelegate
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    // Dismiss the picker if the user canceled.
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    // The info dictionary contains multiple representations of the image, and this uses the original.
    let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    
    // Set photoImageView to display the selected image.
    photoImageView.image = selectedImage
    
    // Dismiss the picker.
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  // MARK: Navigation

  @IBAction func cancel(sender: UIBarButtonItem) {
    let isPresentingInAddMealMode = presentingViewController is UINavigationController
    if isPresentingInAddMealMode {
      dismissViewControllerAnimated(true, completion: nil)
    } else {
      navigationController!.popViewControllerAnimated(true)
    }
  }
  
  // This method is used to configure a view controller before it's presented.
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if saveButton === sender {
      let name = nameTextField.text ?? ""
      let photo = photoImageView.image
      let rating = ratingControl.rating
      
      // Set the meal to be passed to MealTableViewController after the unwind segue.
      meal = Meal(name: name, photo: photo, rating: rating)
    }
  }
  
  // MARK: Actions
  @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
    // Ensure to hide the keyboard.
    photoImageView.resignFirstResponder()
    
    // UIImagePickerController is a view controller that lets a user pick media from their photo library.
    let imagePickerController = UIImagePickerController()
    
    // Only allow photos to be picked, not taken.
    // "sourceType(_:)" sets the image picker controller’s to the place where it gets its images.
    imagePickerController.sourceType = .PhotoLibrary
    
    // Make sure ViewController is notified when the user picks an image.
    imagePickerController.delegate = self
    
    /*
     presentViewController(_:animated:completion:) is a method being called on ViewController.
     Although it’s not written explicitly, this method is executed on an implicit self object.
     The method asks ViewController to present the view controller defined by imagePickerController.
     The completion parameter refers to a completion handler, a piece of code that executes after this method 
     completes.
    */
    presentViewController(imagePickerController, animated: true, completion: nil)
  }
}

