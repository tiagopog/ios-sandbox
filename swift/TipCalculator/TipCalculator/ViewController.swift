//
//  ViewController.swift
//  TipCalculator
//
//  Created by Tiago Guedes on 7/26/15.
//  Copyright (c) 2015 Tiago Guedes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let tipCalc = TipCalculatorModel(total: 100.00, taxPct: 0.10)
  
  @IBOutlet var totalTextField : UITextField!
  @IBOutlet var taxPctSlider : UISlider!
  @IBOutlet var taxPctLabel : UILabel!
  @IBOutlet var resultsTextView : UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    refreshUI()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func calculateTapped(sender : AnyObject) {
    tipCalc.total = Double(totalTextField.text!)!
    let possibleTips = tipCalc.returnPossibleTips()
    var results = ""
    for (tipPct, tipValue) in possibleTips {
      results += "\(tipPct)%: \(tipValue)\n"
    }
    resultsTextView.text = results
  }
  
  @IBAction func taxPercentageChanged(sender : AnyObject) {
    tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
    refreshUI()
  }

  @IBAction func viewTapped(sender : AnyObject) {
    totalTextField.resignFirstResponder()
  }
  
  func refreshUI() {
    totalTextField.text = String(format: "%0.2f", tipCalc.total)
    taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
    taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
    resultsTextView.text = ""
  }
}

