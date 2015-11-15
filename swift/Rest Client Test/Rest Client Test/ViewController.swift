//
//  ViewController.swift
//  Rest Client Test
//
//  Created by Tiago Guedes on 11/15/15.
//  Copyright © 2015 Tiago Guedes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // MARK: Globals
  
  let url_to_request: String = "https://ajax.googleapis.com/ajax/services/search/web?v=1.0&q="

  // MARK: Outlets
  
  @IBOutlet var queryField: UITextField!
  @IBOutlet var searchButton: UIButton!

  // MARK: Actions
  
  @IBAction func searchFromGoogle(sender: AnyObject) {
    let query: String! = queryField.text!
    if query.isEmpty {
      print("Query is empty!")
    } else {
      print("Query is: " + query)
      get_request(query)
    }
  }
  
  // MARK: Default callbacks

  override func viewDidLoad() {
    super.viewDidLoad()
    get_request("foobar")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: HTTP calls
  
  func get_request(query: String) {
    // URL parse and session.
    let url: NSURL = NSURL(string: url_to_request + query)!
    let session = NSURLSession.sharedSession()
    
    // Build the request.
    let request = NSMutableURLRequest(URL: url)
    request.HTTPMethod = "GET"
    request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
    
    let task = session.dataTaskWithRequest(request) {
      (let data, let response, let error) in
      guard let _:NSData = data, let _:NSURLResponse = response where error == nil
      else {
          print("error")
          return
      }
      // Response:
      print(response)

      // Data:
      let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
      print(dataString)      
    }
    
    task.resume()
  }
}

