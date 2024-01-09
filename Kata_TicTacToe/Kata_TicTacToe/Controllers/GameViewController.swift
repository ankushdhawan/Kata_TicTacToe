//
//  ViewController.swift
//  Kata_TicTacToe
//
//  Created by Ankush Dhawan on 09/01/24.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var searchBar:UISearchBar!
    var turnPlayerName = ""

    //Mark:OBJECTS
    var viewModel: GameViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    //MARKS:PRIVATE METHOD(S)
    func setUpUI()
    {
        viewModel = GameViewModel()
        do {
            try viewModel?.addPlayer(symbol: .o, name: "player1")
            try viewModel?.addPlayer(symbol: .x, name: "player2")
        }catch {
            
        }
        turnPlayerName = "player1"
        collectionView.delegate = self
        collectionView.dataSource = viewModel?.dataSource as? UICollectionViewDataSource
        collectionView.reloadData()
    }
    
    func showResultIfGameOver() {
        switch viewModel?.getGameStatus() {
        case .draw:
            print("draw")
            break
        case .playerWon:
            print("player1 won")
            break
        case .opponentWon:
            print("player2 won")
            break
        case .undecided:
            print("inprogress")
            break
        case .none:
            break
        }
    }
}

extension GameViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !(viewModel?.gameIsOver() ?? false)  {
            do {
                try viewModel?.addMove(row: indexPath.section, col: indexPath.row)
                collectionView.reloadData()
                showResultIfGameOver()
            } catch {
                
            }
        }
    }
}

extension GameViewController: UICollectionViewDelegateFlowLayout {
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
       return CGSize(width: 90, height: 90)
    }
}

