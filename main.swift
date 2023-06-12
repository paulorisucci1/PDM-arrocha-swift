
class Arrocha {
  var lowestNumber: Int
  var biggestNumber: Int
  var gameState: State
  let drawnNumber: Int

  init() {
    self.lowestNumber = 1
    self.biggestNumber = 100
    self.drawnNumber = Int.random(in: 1..<100)
    self.gameState = State.STARTED("The game have just started")
  }

  func makeGuess(guess: Int) {
    if (guess <= self.lowestNumber || guess >= self.biggestNumber || self.biggestNumber <= self.lowestNumber || guess == self.drawnNumber) {
      self.lose()
    } else if(guess > self.drawnNumber) {
      self.adjustBiggestNumber(guess: guess)
    } else {
      self.adjustLowestNumber(guess: guess)
    }
    self.verifyIfGuessWon()
  }

  func lose() {
    self.gameState = State.LOSE("You lose!")
  }

  func adjustBiggestNumber(guess: Int) {
    self.biggestNumber = guess
    self.gameState = State.GUESS_BIGGER_THAN_DRAWN_NUMBER("The guess is bigger than the drawn number.")
  }

  func adjustLowestNumber(guess: Int) {
    self.lowestNumber = guess
    self.gameState = State.GUESS_LOWER_THAN_DRAWN_NUMBER("The guess is lower than the drawn number.")
  }

  func verifyIfGuessWon() {
    if(self.lowestNumber + 1 == self.biggestNumber - 1) {
      self.gameState = State.WON("Game won!")
    }
  }
  
  enum State {
    case STARTED(String)
    case WON(String)
    case LOSE(String)
    case GUESS_LOWER_THAN_DRAWN_NUMBER(String)
    case GUESS_BIGGER_THAN_DRAWN_NUMBER(String)
  }
}

var arrocha = Arrocha()
print("Drawn Number: \(arrocha.drawnNumber)")
var guess = ""

while(guess != "STOP") {
  if var guess = readLine(), var validGuess = Int(guess) {
    arrocha.makeGuess(guess: validGuess)
    print(arrocha.gameState)
  } else {
    print("Invalid input.")
  }
}
