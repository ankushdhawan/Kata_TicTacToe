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

    init(board: Board) {
        self.board = board
    }
    
    func addPlayer(player:Player)throws {
        if players.count > Constants.playerCount {
            throw GameError.moreThanTwoPlayers
        }
        players.append(player)
    }
}
