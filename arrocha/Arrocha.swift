//
//  Arrocha.swift
//  arrocha
//
//  Created by ifpb on 12/06/23.
//

import Foundation

class Arrocha {
  var lowestNumber: Int
  var biggestNumber: Int
  var gameState: State
  let drawnNumber: Int

  init() {
    self.lowestNumber = 1
    self.biggestNumber = 100
    self.drawnNumber = Int.random(in: 1..<100)
    self.gameState = State.STARTED
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
    self.gameState = State.LOSE
    print("You lose.")
  }

  func adjustBiggestNumber(guess: Int) {
    self.biggestNumber = guess
    self.gameState = State.GUESS_BIGGER_THAN_DRAWN_NUMBER
    print("The drawn number is lower than this.")
  }

  func adjustLowestNumber(guess: Int) {
    self.lowestNumber = guess
    self.gameState = State.GUESS_LOWER_THAN_DRAWN_NUMBER
    print("The drawn number is bigger than this.")
  }

  func verifyIfGuessWon() {
    if(self.lowestNumber + 1 == self.biggestNumber - 1) {
      self.gameState = State.WON
      print("You won!")
    }
  }

  func gameOver() -> Bool {
    return self.gameState == State.WON || self.gameState == State.LOSE
  }
  
  enum State {
    case STARTED
    case WON
    case LOSE
    case GUESS_LOWER_THAN_DRAWN_NUMBER
    case GUESS_BIGGER_THAN_DRAWN_NUMBER
  }
}
