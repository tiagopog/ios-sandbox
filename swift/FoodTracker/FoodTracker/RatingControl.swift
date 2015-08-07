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
  var rating = 0
  var ratingButtons = [UIButton]()
  
  // MARK: Initialization
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    for _ in 0..<5 {
      // Create a button.
      let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
      button.backgroundColor = UIColor.redColor()

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
    let size = 44
    let margin = 5

    var buttonFrame = CGRect(x: 0, y: 0, width: size, height: size);
    
    for (index, button) in ratingButtons.enumerate() {
      buttonFrame.origin.x = CGFloat(index * (size + margin))
      button.frame = buttonFrame
    }
  }
  
  // MARK: Button Action
  func ratingButtonTapped(button: UIButton) {
    print("Button pressed 👍")
  }
}
