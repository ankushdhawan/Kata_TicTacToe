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
        XCTAssertTrue(game.board.positions.count == 3 && game.board.positions[0].count == 3)
        XCTAssertTrue(game.board.positions[0].first == SquareStatus.empty)
        try? game.board.addMove(row: 0, col: 0, move: .o)
        XCTAssertThrowsError(try game.board.addMove(row: 0, col: 0, move: .o))
    }
    
    func test_AddPlayers() {
        var player1 = Player(name: "Ankush", symbol: .o)
        var player2 = Player(name: "Ank", symbol: .x)
        try? game.addPlayer(player: player1)
        XCTAssertNoThrow(try? game.addPlayer(player: player2))
        XCTAssertTrue(game.players.count == 2)
        var player3 = Player(name: "Ank", symbol: .x)
        XCTAssertThrowsError(try? game.addPlayer(player: player3))

    }


}
