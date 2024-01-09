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
    
    func checkUserMove(row:Int, col:Int, currentMove: SquareStatus) throws {
        if players.count != Constants.playerCount {
            throw GameError.notEnoughPlayers
        }
        
        if board.positions[row][col] != .empty {
            throw GameError.wrongMove
        }
        
        if lastMove == currentMove {
            throw GameError.sameUserMoveAgain
        }
    }
    
    func hasWon(player: Player) -> Bool {
        // diagonal
        var count = 0
        for i in 0...2 {
            if board.positions[i][i] == player.symbol {
                count += 1
            }
        }
        if count == 3 {
            return true
        }
        // other diagonal
        count = 0
        for i in 0...2 {
            if board.positions[i][2-i] == player.symbol {
                count += 1
            }
        }
        if count == 3 {
            return true
        }
        // check rows
        for row in 0...2 {
            count = 0
            for col in 0...2 {
                if board.positions[row][col] == player.symbol {
                    count += 1
                }
            }
            if count == 3 {
                return true
            }
        }
        // check columns
        for col in 0...2 {
            count = 0
            for row in 0...2 {
                if board.positions[row][col] == player.symbol {
                    count += 1
                }
            }
            if count == 3 {
                return true
            }
        }
        // everything checked
        return false
    }
    
    func getResult() -> GameStatus {
        if self.hasWon(player: players[0]) {
            return .playerWon
        }
        
        if self.hasWon(player: players[1]) {
            return .opponentWon
        }
        
        if board.legalMoves.count == 0{
            return .draw
        }
        return .undecided
    }
    
    func isOver() -> Bool {
        return (self.getResult() != .undecided)
    }
    
    func addMove(row:Int, col:Int, move: SquareStatus)throws {
        try checkUserMove(row: row, col: col, currentMove: move)
        board.positions[row][col] = move
        lastMove = move
    }
}
