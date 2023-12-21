//
//  SecretNumberGameRouter.swift
//  Right On Target
//
//  Created by Arthur Raff on 16.12.2023.
//

import Foundation
import UIKit

final class SecretNumberGameRouter {
    weak var viewController: UIViewController?
}

extension SecretNumberGameRouter: SecretNumberGameScreenRouter {
    func showAlertWith(message: String, title: String?, completion: @escaping () -> (Void)) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Начать заново",
                                   style: .default) { _ in
            completion()
        }
        
        alert.addAction(action)
        
        viewController?.present(alert, animated: true, completion: nil)
    }
}
