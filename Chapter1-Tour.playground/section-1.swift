import Cocoa

println("Hello, world!")


var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

let explicitFloat: Float = 4

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// let widthLabel = label + width

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

let firstFloat = 5.0
let secondFloat = 1.3
let floatCalculation = "The product of \(firstFloat) and \(secondFloat) is \(firstFloat * secondFloat)."

let name = "Bob"
let nameGreeting = "Hello, \(name)."

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
shoppingList

var occupations = [
	"Malcolm": "Captain",
	"Kaylee": "Mechanic"
]
occupations["Jayne"] = "Public Relations"
occupations

let emptyArray = [String]() // Fixed from book version
let emptyDictionary = Dictionary<String, Float>()

shoppingList = []

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
	if score > 50 {
		teamScore += 3
	} else {
		teamScore += 1
	}
}
teamScore

var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "John Appleseed"
var greeting = "Hello"
if let name = optionalName {
	greeting = "Hello, \(name)"
}

optionalName = nil
if let name = optionalName {
	greeting = "Hello, \(name)"
} else {
	greeting = "Hello"
}

let vegetable = "red pepper"
switch vegetable {
case "celery":
	let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
	let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
	let vegetableComment = "Is it a spicy \(x)?"
default:
	let vegetableComment = "Everything tastes good in soup."
}

let interestingNumbers = [
	"Prime": [2, 3, 5, 7, 11, 13],
	"Fibonacci": [1, 1, 2, 3, 5, 8],
	"Square": [1, 4, 9, 16, 25]
]
var largest = 0
for (kind, numbers) in interestingNumbers {
	for number in numbers {
		if number > largest {
			largest = number
		}
	}
}
largest

largest = 0
var largestKind = ""
for (kind, numbers) in interestingNumbers {
	for number in numbers {
		if number > largest {
			largest = number
			largestKind = kind
		}
	}
}
largest
largestKind

var n = 2
while n < 100 {
	n = n * 2
}
n

var m = 2
do {
	m = m * 2
} while m < 100
m

var firstForLoop = 0
for i in 0...3 { // Fixed from book version
	firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
	secondForLoop += i // Fixed from book version
}
secondForLoop

func greet(name: String, day: String) -> String {
	return "Hello \(name), today is \(day)."
}
greet("Bob", "Tuesday")

func greetLunch(name: String, lunch: String) -> String {
	return "Hello \(name), lunch today is \(lunch)."
}
greetLunch("Bob", "Pasta")

func getGasPrices() -> (Double, Double, Double) {
	return (3.59, 3.69, 3.79)
}
getGasPrices()

func sumOf(numbers: Int...) -> Int {
	var sum = 0
	for number in numbers {
		sum += number
	}
	return sum
}

sumOf()
sumOf(42, 597, 12)

func average(numbers: Int...) -> Double {
	var sum = 0
	var count = 0
	for number in numbers {
		sum += number
		count++
	}
	return Double(sum) / Double(count)
}

average(42, 597, 13)

func returnFifteen() -> Int {
	var y = 10
	func add() {
		y += 5
	}
	add()
	return y
}
returnFifteen()

func makeIncremeter() -> (Int -> Int) {
	func addOne(number: Int) -> Int {
		return 1 + number
	}
	return addOne
}

var increment = makeIncremeter()
increment(7)

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool { // Corrected from book version
	for item in list {
		if condition(item) {
			return true
		}
	}
	return false
}

func lessThanTen(number: Int) -> Bool {
	return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)

numbers.map({
	(number: Int) -> Int in
	let result = 3 * number
	return result
})

numbers.map({
	(number: Int) -> Int in
	let result = 3 * number * (1 - number % 2)
	return result
})

numbers.map({
	number in 3 * number
})

sorted([1, 5, 3, 12, 2]) // Fixed from book version
	{ $0 > $1 }

class Shape {
	let kind = "shape"
	var numberOfSides = 0
	func simpleDescription() -> String {
		return "A \(kind) with \(numberOfSides) sides."
	}
	
	func changeSides(numberOfSides: Int) {
		self.numberOfSides = numberOfSides
	}
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape {
	var numberOfSides: Int = 0
	var name:String
	
	init(name: String) {
		self.name = name
	}
	
	func simpleDescription() -> String {
		return "A shape with \(numberOfSides) sides."
	}
}

class Square: NamedShape {
	var sideLength: Double
	
	init(sideLength: Double, name:String) {
		self.sideLength = sideLength
		super.init(name: name)
		numberOfSides = 4
	}
	
	func area() -> Double {
		return sideLength * sideLength
	}
	
	override func simpleDescription() -> String {
		return "A square with sides of length \(sideLength)."
	}
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class Circle: NamedShape {
	var radius: Double
	
	init(radius: Double, name: String) {
		self.radius = radius
		super.init(name: name)
		numberOfSides = 1
	}
	
	func area() -> Double {
		return M_PI * radius * radius
	}
	
	override func simpleDescription() -> String {
		return "A circle with radius \(radius)."
	}
}

let testCircle = Circle(radius: 5.2, name: "my circle")
testCircle.area()
testCircle.simpleDescription()

class EquilateralTriangle: NamedShape {
	var sideLength = 0.0
	
	init(sideLength: Double, name: String) {
		self.sideLength = sideLength
		super.init(name: name)
		numberOfSides = 3
	}
	
	var perimiter: Double {
		get {
			return 3.0 * sideLength
		}
		set {
			sideLength = newValue / 3.0
		}
	}
	
	override func simpleDescription() -> String {
		return "An equilateral triangle with sides of length \(sideLength)."
	}
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimiter
triangle.perimiter = 9.9
triangle.sideLength

class TriangleAndSquare {
	var triangle: EquilateralTriangle {
		willSet {
			square.sideLength = newValue.sideLength
		}
	}
	var square: Square {
		willSet {
			triangle.sideLength = newValue.sideLength
		}
	}
	init(size: Double, name: String) {
		square = Square(sideLength: size, name: name)
		triangle = EquilateralTriangle(sideLength: size, name: name)
	}
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength

class Counter {
	var count = 0
	func incrementBy(amount: Int, numberOfTimes times: Int) {
		count += amount * times
	}
}

var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

enum Rank: Int {
	case Ace = 1
	case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
	case Jack, Queen, King
	func simpleDescription() -> String {
		switch self {
		case .Ace:
			return "ace"
		case .Jack:
			return "jack"
		case .Queen:
			return "queen"
		case .King:
			return "king"
		default:
			return String(self.rawValue) // Fixed from book version
		}
	}
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue // Fixed from book version

func compareRanks(first:Rank, second:Rank) -> Int {
	if first.rawValue < second.rawValue {
		return -1
	} else if first.rawValue == second.rawValue {
		return 0
	} else {
		return 1
	}
}
compareRanks(Rank.Four, Rank.King)
compareRanks(Rank.Four, Rank.Four)
compareRanks(Rank.Two, Rank.Ace)

if let convertedRank = Rank(rawValue: 3) { // Fixed from book version
	let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
	case Spades, Hearts, Diamonds, Clubs
	func simpleDescription() -> String {
		switch self {
		case .Spades:
			return "spades"
		case .Hearts:
			return "hearts"
		case .Diamonds:
			return "diamonds"
		case .Clubs:
			return "clubs"
		}
	}
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

enum ColorSuit {
	case Spades, Hearts, Diamonds, Clubs
	func simpleDescription() -> String {
		switch self {
		case .Spades:
			return "spades"
		case .Hearts:
			return "hearts"
		case .Diamonds:
			return "diamonds"
		case .Clubs:
			return "clubs"
		}
	}
	func color() -> String {
		switch self {
		case .Spades, .Clubs:
			return "black"
		case .Hearts, .Diamonds:
			return "red"
		}
	}
}
let spades = ColorSuit.Spades
let spadesDescription = spades.simpleDescription()
let spadesColor = spades.color()

struct Card {
	var rank: Rank
	var suit: Suit
	func simpleDescription() -> String {
		return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
	}
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

struct BetterCard {
	var rank: Rank
	var suit: Suit
	func simpleDescription() -> String {
		return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
	}
	
	func deck() -> [Card] {
		var deck: [Card] = []
		for suit in [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs] {
			for rawRank in 1...13 {
				if let rank = Rank(rawValue: rawRank) {
					deck.append(Card(rank: rank, suit: suit))
				}
			}
		}
		return deck
	}
}

var betterCard = BetterCard(rank: .Ace, suit: .Spades)
var deck = betterCard.deck()

enum ServerResponse {
	case Result(String, String)
	case Error(String)
	case TimeOut(Int)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
	let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
	let serverResponse = "Failure... \(error)"
case let .TimeOut(time):
	let serverResponse = "Timed out after \(time) seconds"
}

protocol ExampleProtocol {
	var simpleDescription: String { get }
	mutating func adjust()
}

class SimpleClass: ExampleProtocol {
	var simpleDescription: String = "A very simple class."
	var anotherProperty: Int = 69105
	func adjust() {
		simpleDescription += " Now 100% adjusted."
	}
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
	var simpleDescription: String = "A simple structure."
	mutating func adjust() {
		simpleDescription += " (adjusted)"
	}
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

enum Toggle: ExampleProtocol {
	case On, Off
	var simpleDescription: String {
		switch self {
		case .On:
			return "A toggle in the on position."
		case .Off:
			return "A toggle in the off position."
		}
	}
	mutating func adjust() {
		switch self {
		case .On:
			self = .Off
		case .Off:
			self = .On
		}
	}
}

var toggle = Toggle.On
toggle.adjust()
toggle.simpleDescription

extension Int: ExampleProtocol {
	var simpleDescription: String {
		return "The number \(self)"
	}
	mutating func adjust() {
		self += 42
	}
}
7.simpleDescription

extension Double {
	var absoluteValue: Double {
		if self < 0.0{
			return -1.0 * self
		} else {
			return self
		}
	}
}
(7.0).absoluteValue
(-1.0).absoluteValue

let protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
// protocolValue.anotherProperty

func repeat<ItemType>(item: ItemType, times: Int) -> [ItemType] { // Fixed from book version
	var result = [ItemType]() // Fixed from book version
	for i in 0...times { // Fixed from book version
		result.append(item) // Fixed from book version
	}
	return result
}
repeat("knock", 4)

enum OptionalValue<T> {
	case None
	case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> Bool { // Fixed from book version
	for lhsItem in lhs {
		for rhsItem in rhs {
			if lhsItem == rhsItem {
				return true
			}
		}
	}
	return false
}
anyCommonElements([1, 2, 3], [3])

func getCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> Array<Any> {
	var common:Array<Any> = []
	for lhsItem in lhs {
		for rhsItem in rhs {
			if lhsItem == rhsItem {
				common.append(lhsItem)
			}
		}
	}
	return common
}
getCommonElements([1, 2, 3, 4], [1, 3])
