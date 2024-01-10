//
//  GameViewModel.swift
//  Kata_TicTacToe
//
//  Created by Ankush Dhawan on 09/01/24.
//

import Foundation
protocol GameViewModelProtocol {
    var dataSource:GameDataSource? {
        get
        set
    }
    func addMove(row:Int, col:Int)throws
    func addPlayer(symbol:SquareStatus, name:String)throws
    func getSymbol(row:Int, col:Int) ->String
    func getGameStatus()-> GameStatus
    func gameIsOver() -> Bool
    func getWinPlayerSymbol(index:Int) -> String
    func resetGame()
}

class GameViewModel:GameViewModelProtocol {
    var turnPlayerIndex = -1
    var dataSource: GameDataSource?
    var game: Game?
    
    init() {
        let board = Board()
        self.game = Game(board: board)
        self.dataSource = GameDataSource(game: game ?? Game(board: board))
    }
    
    func addMove(row: Int, col: Int)throws {
        if game?.players.count != 2 {
            throw GameError.notEnoughPlayers
        }
        turnPlayerIndex = turnPlayerIndex != 0 ? 0 :  1
        try game?.addMove(row: row, col: col, move: game?.players[turnPlayerIndex].symbol ?? .empty)
    }
    
    func addPlayer(symbol: SquareStatus, name: String)throws {
        try game?.addPlayer(player: Player(name: name, symbol: symbol))
    }
    
    func getSymbol(row: Int, col: Int) ->String {
        return game?.board.positions[row][col].getLabelValue() ?? ""
    }
    
    func getGameStatus() -> GameStatus {
        return game?.getResult() ?? .undecided
    }
    
    func gameIsOver() -> Bool {
        return game?.isOver() ?? false
    }
    
    func getWinPlayerSymbol(index:Int) -> String {
        if index < game?.players.count ?? 2 {
            return game?.players[index].symbol.getLabelValue() ?? ""
        }
        return ""
    }
    
    func resetGame() {
        game?.resetGame()
    }
    
}
