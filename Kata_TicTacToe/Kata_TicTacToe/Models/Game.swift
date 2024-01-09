//
//  Game.swift
//  Kata_TicTacToe
//
//  Created by Ankush Dhawan on 09/01/24.
//

import Foundation

class Game {
    var board:Board
    var players = [Player]()
    var lastMove:SquareStatus?

    init(board: Board) {
        self.board = board
    }
    
    func addPlayer(player:Player)throws {
        if players.count >= Constants.playerCount {
            throw GameError.moreThanTwoPlayers
        }
        players.append(player)
    }
    
    func checkUserMove(row:Int, col:Int) throws {
        if players.count != Constants.playerCount {
            throw GameError.notEnoughPlayers
        }
        
        if board.positions[row][col] != .empty {
            throw GameError.wrongMove
        }
    }
    
    func addMove(row:Int, col:Int, move: SquareStatus)throws {
        try checkUserMove(row: row, col: col)
        board.positions[row][col] = move
        lastMove = move
    }
}
