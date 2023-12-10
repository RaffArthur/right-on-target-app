//
//  GameSelectionProtocols.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation
import UIKit

protocol GameSelectionViewDelegate: AnyObject {
    func secretNumberGameButtonWasTapped()
    func selectColorGameButtonWasTapped()
}

protocol GameSelectionScreenRouter: AnyObject {
    func showSecretNumberGameScreen()
    func showSelectColorGameScreen()
}

protocol GameSelectionFactory: AnyObject {
    func createGameSelectionScreenModule() -> UIViewController
}
