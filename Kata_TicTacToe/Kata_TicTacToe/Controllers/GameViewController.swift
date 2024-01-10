//
//  ViewController.swift
//  Kata_TicTacToe
//
//  Created by Ankush Dhawan on 09/01/24.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var collectionView:UICollectionView!
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
        }catch GameError.moreThanTwoPlayers{
            showAlert(title: Constants.Alerts.errorTitle, message: Constants.Alerts.moreThanTwoPlayer)
        } catch {
            showAlert(title: Constants.Alerts.errorTitle, message: Constants.Alerts.moreThanTwoPlayer)
        }
        
        turnPlayerName = "player1"
        collectionView.delegate = self
        collectionView.dataSource = viewModel?.dataSource as? UICollectionViewDataSource
        collectionView.reloadData()
    }
    
    func showResultIfGameOver() {
        switch viewModel?.getGameStatus() {
        case .draw:
            showAlert(title: "", message: Constants.Alerts.draw)
            break
        case .playerWon:
            let symbol = viewModel?.getWinPlayerSymbol(index: 0)
            showAlert(title: "", message: "Game is won by \(symbol!)")
            break
        case .opponentWon:
            var symbol = viewModel?.getWinPlayerSymbol(index: 1)
            showAlert(title: "", message: "Game is won by \(symbol!)")
            break
        case .undecided:
            break
        case .none:
            break
        }
    }
    
    func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func resetGame(sender:UIButton) {
        viewModel?.resetGame()
        collectionView.reloadData()
    }

}

extension GameViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !(viewModel?.gameIsOver() ?? false)  {
            do {
                try viewModel?.addMove(row: indexPath.section, col: indexPath.row)
                collectionView.reloadData()
                showResultIfGameOver()
            } catch GameError.wrongMove{
                showAlert(title: Constants.Alerts.errorTitle, message: Constants.Alerts.wrongMove)
            } catch GameError.notEnoughPlayers{
                showAlert(title: Constants.Alerts.errorTitle, message: Constants.Alerts.notEnoughPlayer)
            } catch GameError.sameUserMoveAgain{
                showAlert(title: Constants.Alerts.errorTitle, message: Constants.Alerts.samePlayer)
            } catch {
                showAlert(title: Constants.Alerts.errorTitle, message: Constants.Alerts.errorMessage)
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

