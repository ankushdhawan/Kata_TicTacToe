//
//  Player.swift
//  Kata_TicTacToe
//
//  Created by Ankush Dhawan on 09/01/24.
//

import Foundation

class Player {
    var name:String
    var symbol: SquareStatus
    
    init(name: String, symbol: SquareStatus) {
        self.name = name
        self.symbol = symbol
    }
}
