//
//  DataSource.swift
//  Kata_TicTacToe
//
//  Created by Ankush Dhawan on 09/01/24.
//

import Foundation
import UIKit
protocol GameDataSourceProtocol {
    var game:Game {
        get
        set
    }
}

class GameDataSource:NSObject, GameDataSourceProtocol {
    var game: Game
    
    init(game: Game) {
        self.game = game
        super.init()
        
    }
}

extension GameDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        game.board.positions.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        game.board.positions[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.gameeCellIndentifier, for: indexPath as IndexPath) as! GameCell
        cell.symbolLabel.text = game.board.positions[indexPath.section][indexPath.row].getLabelValue()
        return cell
    }
}
