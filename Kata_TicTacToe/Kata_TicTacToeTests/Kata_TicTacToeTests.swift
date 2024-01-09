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
        game = Game()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        game = nil
    }
    
    func test_AddEmptyBorad() {
        game.createEmptyBoard()
        XCTAssertTrue(game.board.count == 3 && game.board[0].count == 3)
    }


}
