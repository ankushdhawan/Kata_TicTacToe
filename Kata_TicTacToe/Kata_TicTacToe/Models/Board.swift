//
//  Board.swift
//  Kata_TicTacToe
//
//  Created by Ankush Dhawan on 09/01/24.
//

import Foundation

class Board {
    var positions = [[SquareStatus]]()
    var legalMoves: [Int] {
        return positions.indices.filter { positions[$0][$0] == .empty }
    }
    
    init() {
        self.positions = createEmptyBoard()
    }
    
    func createEmptyBoard() -> [[SquareStatus]] {
        var emptyPositions = [[SquareStatus]]()
        for _ in 0...Constants.BoardSize.rowSize - 1 {
            var square = [SquareStatus]()
            for _ in 0...Constants.BoardSize.colSizs - 1 {
                square.append(.empty)
            }
            emptyPositions.append(square)
        }
        return emptyPositions
    }
    
}
