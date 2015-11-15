//
//  Meal.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 5/26/15.
//  Copyright © 2015 Apple Inc. All rights reserved.
//  See LICENSE.txt for this sample’s licensing information.
//

import UIKit

class Meal: NSObject, NSCoding {
  // MARK: Properties
  
  var name: String
  var photo: UIImage?
  var rating: Int
  
  // MARK: Archiving paths
  
  static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
  static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
  
  // MARK: Types
  
  struct PropertyKey {
    static let nameKey = "name"
    static let photoKey = "photo"
    static let ratingKey = "rating"
  }
  
  // MARK: Initialization
  
  init?(name: String, photo: UIImage?, rating: Int) {
    // Initialize stored properties.
    self.name = name
    self.photo = photo
    self.rating = rating
    
    super.init()
    
    // Initialization should fail if there is no name or if the rating is negative.
    if name.isEmpty || rating < 0 {
      return nil
    }
  }
 
  // MARK: NSCoding
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
    aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
    /*
     * FIXME: It's getting an error when loading rating from
     * NSKeyedUnarchiver.unarchiveObjectWithFile
     * Error: NSInvalidUnarchiveOperationException', reason: '*** -[NSKeyedUnarchiver decodeInt32ForKey:]: value
     * for key (rating) is not an integer number'
     */
    // aCoder.encodeObject(rating, forKey: PropertyKey.ratingKey)
  }
  
  required convenience init?(coder aDecoder: NSCoder) {
    /* The return value of decodeObjectForKey(_:) is AnyObject,
       which is downcasted in the code above as a String */
    let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
    
    /* In this case, it downcastes using the optional type cast operator (as?),
       because the photo property is an optional, so the value might be a UIImage,
       or it might be nil */
    let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
    
    /* Because the return value of decodeIntegerForKey is Int, there’s no need to
       downcast the decoded value. */
    let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
    
    // Must call designated initilizer.
    self.init(name: name, photo: photo, rating: rating)
    
  }
}