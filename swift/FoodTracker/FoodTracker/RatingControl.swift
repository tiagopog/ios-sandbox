//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Tiago Guedes on 8/6/15.
//  Copyright © 2015 Tiago Guedes. All rights reserved.
//

import UIKit

class RatingControl: UIView {
  // MARK: Properties
  var rating = 0 {
  didSet {
    // setNeedsLayout() will trigger a layout update every time the rating changes
    setNeedsLayout()
  }
  }
  var ratingButtons = [UIButton]()
  var spacing = 5
  var stars = 5
  
  // MARK: Initialization
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    let filledStarImage = UIImage(named: "filledStar")
    let emptyStartImage = UIImage(named: "emptyStar")
    
    for _ in 0..<stars {
      // Create a button.
      let button = UIButton()
      
      button.setImage(emptyStartImage, forState: .Normal)
      button.setImage(filledStarImage, forState: .Selected)
      button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
      
      button.adjustsImageWhenHighlighted = false

      /*
      Without Interface Builder it does not need to define the action method with the IBAction attribute;
      just define the action like any other method.
      */
      button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
      
      // Add button to the array of buttons.
      ratingButtons += [button]
    
      // The addSubview() method adds the button to the RatingControl view.
      addSubview(button)
    }
  }
  
  override func layoutSubviews() {
    let buttonSize = Int(frame.size.height)

    var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize);
    
    for (index, button) in ratingButtons.enumerate() {
      buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
      button.frame = buttonFrame
    }

    updateButtonSelectionState()
  }
  
  // MARK: Button Action
  func ratingButtonTapped(button: UIButton) {
    rating = ratingButtons.indexOf(button)! + 1

    updateButtonSelectionState()
  }
  
  func updateButtonSelectionState() {
    for (index, button) in ratingButtons.enumerate() {
      button.selected = index < rating
    }
  }
}
