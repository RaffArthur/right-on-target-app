//
//  SecretNumberGameViewController.swift
//  Right On Target
//
//  Created by Arthur Raff on 03.12.2023.
//

import Foundation
import UIKit

final class SecretNumberGameViewController: UIViewController {
    private var gameService: SecretNumberGameServiceImpl?
        
    private lazy var gameView = SecretNumberGameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.delegate = self
        
        gameService = SecretNumberGameServiceImpl(startValue: 1, endValue: 50, rounds: 5)
        
        guard let gameService = gameService else { return }
        
        gameView.setIntentedNumber(number: String(gameService.currentSecretValue))
        
    }
    
    override func loadView() {
        view = gameView
    }
}

extension SecretNumberGameViewController: SecretNumberGameViewDelegate {
    func secretNumberWasChecked() {
        let numSlider = gameView.getNumberPositionOnSliderValue()
        
        guard let gameService = gameService else { return }

        gameService.calculateScoreWith(value: numSlider)
        
        if gameService.isGameEnded {
            showAlertWith(score: gameService.score)
            gameView.setCheckNumberButtonTitle(title: "Завершено")
            
            gameService.restartGame()
        } else {
            gameView.setCheckNumberButtonTitle(title: "Проверить")
            
            gameService.startNewRound()
        }
        
        gameView.setIntentedNumber(number: String(gameService.currentSecretValue))
    }
}

private extension SecretNumberGameViewController {
    func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена",
                                      message: "Заработано очков: \(score)",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Начать заново",
                                   style: .default) { [weak self] _ in
            self?.gameView.setCheckNumberButtonTitle(title: "Проверить")
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
