//
//  SelectColorGameRouter.swift
//  Right On Target
//
//  Created by Arthur Raff on 16.12.2023.
//

import Foundation
import UIKit

final class SelectColorGameRouter {
    weak var viewController: UIViewController?
}

extension SelectColorGameRouter: SelectColorGameScreenRouter {
    func showAlertWith(message: String, title: String?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Начать заново",
                                   style: .default)
        
        alert.addAction(action)
        
        viewController?.present(alert, animated: true, completion: nil)
    }
}
