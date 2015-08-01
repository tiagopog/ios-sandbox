// Constants:
let tutorialTeam: Int = 60
let editorialTeam = 17
// Variables:
var totalTeam = tutorialTeam + editorialTeam
totalTeam += 1

// Inference and explicit typing:
let priceInferred = 19.99
let priceExplicit: Double = 19.99
let valueExplicitInFloat: Float = 10.55

let onSaleInferred = true
let onSaleExplicit: Bool = false

let nameInferred = "Foobar"
let nameExplict: String = "Foobar"

// Flow control statement:
if onSaleInferred {
  println("\(nameInferred) on sale for \(priceInferred)")
} else {
  println("\(nameInferred) at regular price: \(priceInferred)")
}

