//
//  GameSelectionRouter.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation
import UIKit

final class GameSelectionRouter {
    weak var viewController: UIViewController?
}

extension GameSelectionRouter: GameSelectionScreenRouter {
    func showSecretNumberGameScreen() {
        let vc = SecretNumberGameViewController()
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showSelectColorGameScreen() {
        let factory = SelectColorGameFactoryImpl()
        let vc = factory.createSelectColorGameScreenModule()
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
