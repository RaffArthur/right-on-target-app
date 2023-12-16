//
//  SecretNumberGameViewController.swift
//  Right On Target
//
//  Created by Arthur Raff on 03.12.2023.
//

import Foundation
import UIKit

final class SecretNumberGameViewController: UIViewController {
    var router: SecretNumberGameScreenRouter?
    
    private lazy var gameService = SecretNumberGameServiceImpl(startValue: 1, endValue: 50, rounds: 5)
        
    private lazy var gameView = SecretNumberGameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.delegate = self
                
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
            router?.showAlertWith(message: "Заработано очков \(gameService.score)", title: "Игра окончена") { [weak self] in
                self?.gameView.setCheckNumberButtonTitle(title: "Проверить")
            }
            
            gameView.setCheckNumberButtonTitle(title: "Завершено")
            
            gameService.restartGame()
        } else {
            gameView.setCheckNumberButtonTitle(title: "Проверить")
            
            gameService.startNewRound()
        }
        
        gameView.setIntentedNumber(number: String(gameService.currentSecretValue))
    }
}
