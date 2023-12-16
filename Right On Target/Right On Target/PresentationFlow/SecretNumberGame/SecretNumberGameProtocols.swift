//
//  SecretNumberGameProtocol.swift
//  Right On Target
//
//  Created by Arthur Raff on 03.12.2023.
//

import Foundation
import UIKit

protocol SecretNumberGameViewDelegate: AnyObject {
    func secretNumberWasChecked()
}

protocol SecretNumberGameScreenRouter: AnyObject {
    func showAlertWith(message: String, title: String?, completion: @escaping () -> (Void))
}

protocol SecretNumberGameFactory: AnyObject {
    func createSecretNumberGameScreenModule() -> UIViewController
}
