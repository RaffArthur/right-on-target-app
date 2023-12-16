//
//  GameSelectionFactory.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation
import UIKit

final class GameSelectionFactoryImpl: GameSelectionFactory {
    func createGameSelectionScreenModule() -> UIViewController {
        let view = GameSelectionViewController()
        let router = GameSelectionRouter()
        
        view.router = router
        router.viewController = view
        
        return view
    }
}
