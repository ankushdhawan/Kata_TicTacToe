//
//  Game.swift
//  Kata_TicTacToe
//
//  Created by Ankush Dhawan on 09/01/24.
//

import Foundation
class Game {
   var board = [[String]]()

    func createEmptyBoard() {
        for _ in 0...Constants.BoardSize.rowSize - 1 {
            var positions = [String]()
            for _ in 0...Constants.BoardSize.colSizs - 1 {
                positions.append("")
            }
            board.append(positions)
        }
    }
}
