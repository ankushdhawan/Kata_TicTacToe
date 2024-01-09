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
        var board = Board()
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


}
