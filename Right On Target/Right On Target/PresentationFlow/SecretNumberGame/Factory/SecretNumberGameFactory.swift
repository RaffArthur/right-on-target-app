//
//  SecretNumberGameFactory.swift
//  Right On Target
//
//  Created by Arthur Raff on 16.12.2023.
//

import Foundation
import UIKit

final class SecretNumberGameFactoryImpl: SecretNumberGameFactory {
    func createSecretNumberGameScreenModule() -> UIViewController {
        let view = SecretNumberGameViewController()
        let router = SecretNumberGameRouter()
        
        view.router = router
        router.viewController = view
        
        return view
    }
}
