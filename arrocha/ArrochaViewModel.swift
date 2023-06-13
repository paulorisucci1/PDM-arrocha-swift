//
//  ArrochaViewModel.swift
//  arrocha
//
//  Created by ifpb on 12/06/23.
//

import Foundation

public class ArrochaViewModel: ObservableObject {
    
    var arrocha: Arrocha = Arrocha()
    
    func chutar(guess: Int) {
        arrocha.makeGuess(guess: guess)
    }
}
