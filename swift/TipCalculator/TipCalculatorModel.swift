//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Tiago Guedes on 7/26/15.
//  Copyright (c) 2015 Tiago Guedes. All rights reserved.
//

import Foundation

class TipCalculatorModel {
  var total: Double
  var taxPct: Double
  
  var subtotal: Double {
    get {
      return total / (taxPct + 1)
    }
  }
  
  init(total: Double, taxPct: Double) {
    self.total = total
    self.taxPct = taxPct
  }
  
  func calcTipWithTipPct(tipPct: Double) -> Double {
    return subtotal * tipPct
  }
  
  func printPossibleTips() {
    let possibleTipsInferred = [0.15, 0.18, 0.20]
    let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
    
    for possibleTip in possibleTipsInferred {
      print("\(possibleTip * 100)%: \(calcTipWithTipPct(possibleTip))")
    }
  }
  
  func returnPossibleTips() -> [Int: Double] {
    let possibleTipsInferred = [0.15, 0.18, 0.20]
    let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
    
    var retval = [Int: Double]()
    
    for possibleTip in possibleTipsInferred {
      let intPct = Int(possibleTip*100)
      retval[intPct] = calcTipWithTipPct(possibleTip)
    }
    return retval
  }
}
