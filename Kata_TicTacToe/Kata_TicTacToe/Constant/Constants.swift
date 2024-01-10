//
//  Constant.swift
//  Kata_TicTacToe
//
//  Created by Ankush Dhawan on 09/01/24.
//

import Foundation
struct Constants {
    struct BoardSize {
        static let rowSize = 3
        static let colSizs = 3
    }
    
    struct Alerts {
        
        static let wrongMove = "Wrong Move"
        static let errorTitle = "Error"
        static let samePlayer = "Same user cannot move again."
        static let notEnoughPlayer = "Not Enough Players"
        static let draw = "Game is Draw"
        static let moreThanTwoPlayer = "Morethan two player cannot be added"
        static let errorMessage = "Something went wrong."
    }
    static let playerCount = 2
    static let gameeCellIndentifier = "GameCell"
}
