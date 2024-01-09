//
//  Kata_TicTacToeTests.swift
//  Kata_TicTacToeTests
//
//  Created by Ankush Dhawan on 09/01/24.
//

import XCTest
@testable import Kata_TicTacToe

final class Kata_TicTacToeTests: XCTestCase {
    var game: Game!
    override func setUp() {
        let board = Board()
        game = Game(board: board)
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        game = nil
    }
    
    func test_AddEmptyBorad() {
        test_AddPlayers()
        XCTAssertTrue(game.board.positions.count == 3 && game.board.positions[0].count == 3)
        XCTAssertTrue(game.board.positions[0].first == SquareStatus.empty)
        XCTAssertNoThrow(try game.addMove(row: 0, col: 0, move: .o))
        XCTAssertThrowsError(try game.addMove(row: 0, col: 0, move: .o))
        XCTAssertThrowsError(try game.addMove(row: 0, col: 0, move: .o))
        XCTAssertNoThrow(try game.addMove(row: 0, col: 1, move: .x))
    }
    
    func test_player1winnerCase() {
        test_AddPlayers()
        try? game.addMove(row: 0, col: 0, move: .o)
        try? game.addMove(row: 1, col: 0, move: .x)
        XCTAssertTrue(game.getResult() == .undecided)
        try? game.addMove(row: 0, col: 1, move: .o)
        try? game.addMove(row: 1, col: 1, move: .x)
        try? game.addMove(row: 0, col: 2, move: .o)
        XCTAssertTrue(game.getResult() == .playerWon)
    }
    
    func test_player2winnerCase() {
        test_AddPlayers()
        try? game.addMove(row: 0, col: 0, move: .o)
        try? game.addMove(row: 1, col: 0, move: .x)
        try? game.addMove(row: 0, col: 1, move: .o)
        try? game.addMove(row: 1, col: 1, move: .x)
        try? game.addMove(row: 2, col: 0, move: .o)
        try? game.addMove(row: 1, col: 2, move: .x)
        XCTAssertTrue(game.getResult() == .opponentWon)
    }
    
    func test_DrawCase() {
        test_AddPlayers()
        try? game.addMove(row: 0, col: 0, move: .o)
        try? game.addMove(row: 1, col: 0, move: .x)
        try? game.addMove(row: 0, col: 1, move: .o)
        try? game.addMove(row: 1, col: 1, move: .x)
        try? game.addMove(row: 2, col: 0, move: .o)
        try? game.addMove(row: 2, col: 1, move: .x)
        try? game.addMove(row: 2, col: 2, move: .o)
        try? game.addMove(row: 0, col: 2, move: .x)
        try? game.addMove(row: 1, col: 2, move: .o)
        XCTAssertTrue(game.getResult() == .draw)
    }
    
    func test_AddPlayers() {
        let player1 = Player(name: "Ankush", symbol: .o)
        let player2 = Player(name: "Ank", symbol: .x)
        try? game.addPlayer(player: player1)
        XCTAssertNoThrow(try? game.addPlayer(player: player2))
        XCTAssertTrue(game.players.count == 2)
        let player3 = Player(name: "Ank", symbol: .x)
        XCTAssertThrowsError(try game.addPlayer(player: player3))
    }


}
