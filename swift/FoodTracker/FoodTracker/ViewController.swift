//
//  ViewController.swift
//  FoodTracker
//
//  Created by Tiago Guedes on 8/2/15.
//  Copyright © 2015 Tiago Guedes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  // MARK: Properties
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var mealNameLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
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
  
  // MARK: Actions
  @IBAction func setDefaultLabelText(sender: UIButton) {
    mealNameLabel.text = "Default Text"
  }
}

