//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Tiago Guedes on 8/2/15.
//  Copyright © 2015 Tiago Guedes. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
  // MARK: FoodTracker Tests

  func testMealInitialization() {
    // Success case.
    let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
    XCTAssertNotNil(potentialItem)
    
    // Failure cases.
    let noName = Meal(name: "", photo: nil, rating: 0)
    XCTAssertNil(noName, "Empty name is invalid")
    
    let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
    XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
  }
}
