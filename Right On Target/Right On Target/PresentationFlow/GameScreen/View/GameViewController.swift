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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        view = gameView
    }
}
