//
//  GameViewModelTest.swift
//  Kata_TicTacToeTests
//
//  Created by Ankush Dhawan on 10/01/24.
//

import Foundation
import XCTest
@testable import Kata_TicTacToe

final class GameViewModelTest: XCTestCase {
    var gameViewModel: GameViewModelProtocol!
    override func setUp() {
        gameViewModel = GameViewModel()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        gameViewModel = nil
    }
    
    func test_AddPlayer() {
        XCTAssertNoThrow(try gameViewModel.addPlayer(symbol: .o, name: "aaa"))
        XCTAssertNoThrow(try gameViewModel.addPlayer(symbol: .x, name: "aaa"))
        XCTAssertThrowsError(try gameViewModel.addPlayer(symbol: .o, name: "aaa"))
    }
    
    func test_AddMove() {
        XCTAssertThrowsError(try gameViewModel.addMove(row: 0, col: 0))
        test_AddPlayer()
        XCTAssertNoThrow(try gameViewModel.addMove(row: 0, col: 0))
        XCTAssertThrowsError(try gameViewModel.addMove(row: 0, col: 0))
    }
    
    func test_GetSymbol() {
        test_AddPlayer()
        try? gameViewModel.addMove(row: 0, col: 0)
        XCTAssertTrue(gameViewModel.getSymbol(row: 0, col: 0) == "O")
    }
    
    func test_GetGameStatus() {
        test_AddPlayer()
        try? gameViewModel.addMove(row: 0, col: 0)
        XCTAssertTrue(gameViewModel.getGameStatus() == .undecided)

    }
    
    func test_GameIsOver() {
        test_AddPlayer()
        try? gameViewModel.addMove(row: 0, col: 0)
        XCTAssertFalse(gameViewModel.gameIsOver())
    }
}
