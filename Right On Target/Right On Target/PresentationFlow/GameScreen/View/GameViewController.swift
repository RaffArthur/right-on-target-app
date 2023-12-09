//
//  GameViewController.swift
//  Right On Target
//
//  Created by Arthur Raff on 03.12.2023.
//

import Foundation
import UIKit

final class GameViewController: UIViewController {
    private lazy var gameView = GameView()
    
    private lazy var round: Int = 0
    private lazy var number: Int = 0
    private lazy var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.setCheckNumberButtonTitle(title: "НАЧАТЬ")
        gameView.delegate = self
    }
    
    override func loadView() {
        view = gameView
    }
}

extension GameViewController: GameViewDelegate {
    func intendedNumberWasChecked() {
        gameView.setCheckNumberButtonTitle(title: "Проверить")

        if round == 0 {
            number = Int.random(in: 1...50)
            
            gameView.setIntentedNumber(number: String(number))
            
            round = 1
        } else {
            let numSlider = gameView.getNumberPositionValue()
            
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            
            if round == 5 {
                let alert = UIAlertController(title: "Игра окончена",
                                              message: "Заработано очков: \(points)",
                                              preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Начать заново", style: .default) { [weak self] _ in
                    self?.gameView.setCheckNumberButtonTitle(title: "Проверить")
                }
                
                alert.addAction(action)
                
                present(alert, animated: true, completion: nil)
                
                round = 0
                
                points = 0
                
                gameView.setCheckNumberButtonTitle(title: "НАЧАТЬ")
            } else {
                round += 1
            }
            
            number = Int.random(in: 1...50)
            
            gameView.setIntentedNumber(number: String(number))
        }
    }
}
