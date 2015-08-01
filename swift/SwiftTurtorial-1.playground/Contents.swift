class TipCalculator {
  let total: Double
  let taxPct: Double
  let subtotal: Double
  
  // Class constructor:
  init(total: Double, taxPct: Double) {
    // Here we need to use "self" so the compiler will not get confused about the variables with the same name:
    self.total = total
    self.taxPct = taxPct

    // No need for "self" here since there is no any other variable with this name:
    subtotal = total / (taxPct + 1)
  }
  
  func calcTipWithTipPct(tipPct: Double) -> Double {
    return subtotal * tipPct
  }
  
  func printPossibleTips() {
    let possibleTipsInferred = [0.15, 0.18, 0.20]
    let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
    
    for possibleTip in possibleTipsInferred {
      println("\(possibleTip * 100)%: \(calcTipWithTipPct(possibleTip))")
    }
  }
  
  func returnPossibleTips() -> [Int: Double] {
    let possibleTipsInferred = [0.15, 0.18, 0.20]
    let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
  
    var retval = [Int: Double]()
    for possibleTip in possibleTipsInferred {
      let intPct = Int(possibleTip*100)
      // 3
      retval[intPct] = calcTipWithTipPct(possibleTip)
    }
    return retval
  }
}

let tipCalc = TipCalculator(total: 100.00, taxPct: 10.00)
tipCalc.printPossibleTips()
tipCalc.returnPossibleTips()
