//
//  GameSelectionViewController.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation
import UIKit

final class GameSelectionViewController: UIViewController {
    var router: GameSelectionScreenRouter?
    
    private lazy var gameSelectionView = GameSelectionView()
    
    override func loadView() {
        view = gameSelectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameSelectionView.delegate = self
    }
}

extension GameSelectionViewController: GameSelectionViewDelegate {
    func secretNumberGameButtonWasTapped() {
        router?.showSecretNumberGameScreen()
    }
    
    func selectColorGameButtonWasTapped() {
        router?.showSelectColorGameScreen()
    }
}
