//
//  SelectColorGameViewController.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation
import UIKit

final class SelectColorGameViewController: UIViewController {
    var router: SelectColorGameScreenRouter?
    
    private lazy var gameService = SelectColorGameServiceImpl(rounds: 5)
    
    private lazy var selectColorGameView = SelectColorGameView()
    
    override func loadView() {
        view = selectColorGameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen()
        setupSelectColorGameHexes()
    }
}

private extension SelectColorGameViewController {
    func setupScreen() {
        selectColorGameView.delegate = self
    }
    
    func setupSelectColorGameHexes() {
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
            router?.showAlertWith(message: "Заработано очков: \(gameService.score)",
                                  title: "Игра окончена")
            
            gameService.restartGame()
        } else {
            gameService.startNewRound()
        }
        
        setupSelectColorGameHexes()
    }
}
