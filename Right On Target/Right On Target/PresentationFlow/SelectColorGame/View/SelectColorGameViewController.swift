//
//  SelectColorGameViewController.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation
import UIKit

final class SelectColorGameViewController: UIViewController {
    private lazy var gameService = SelectColorGameServiceImpl(rounds: 5)
    
    private lazy var selectColorGameView = SelectColorGameView()
    
    override func loadView() {
        view = selectColorGameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectColorGameView.delegate = self
        
        guard let gameService = gameService else { return }
                
        selectColorGameView.setHexColorsForButtons(hexes: gameService.hexValues)
        selectColorGameView.setIntendedHex(hex: gameService.currentHexValue)        
    }
}

extension SelectColorGameViewController: SelectColorGameViewDelegate {
    func colorWasSelected(hex: String) {
        guard let gameService = gameService else { return }
        
        gameService.calculateScoreWith(value: hex)
        
        if gameService.isGameEnded {
            showAlertWith(score: gameService.score)
            
            gameService.restartGame()
        } else {
            gameService.startNewRound()
        }
        
        selectColorGameView.setHexColorsForButtons(hexes: gameService.hexValues)
        selectColorGameView.setIntendedHex(hex: gameService.currentHexValue)
    }
}

private extension SelectColorGameViewController {
    func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена",
                                      message: "Заработано очков: \(score)",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Начать заново",
                                   style: .default)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
