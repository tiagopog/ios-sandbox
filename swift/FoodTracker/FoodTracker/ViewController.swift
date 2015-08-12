//
//  ViewController.swift
//  FoodTracker
//
//  Created by Tiago Guedes on 8/2/15.
//  Copyright © 2015 Tiago Guedes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,
  UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  // MARK: Properties
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var mealNameLabel: UILabel!
  @IBOutlet weak var photoImageView: UIImageView!
  @IBOutlet weak var ratingControl: RatingControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Handle the text field’s user input through delegate callbacks.
    nameTextField.delegate = self
  }

  // MARK: UITextFieldDelegate
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    // Hide the keyboard.
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    mealNameLabel.text = textField.text
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

