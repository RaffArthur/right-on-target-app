//
//  SelectColorGameFactory.swift
//  Right On Target
//
//  Created by Arthur Raff on 16.12.2023.
//

import Foundation
import UIKit

final class SelectColorGameFactoryImpl: SelectColorGameFactory {
    func createSelectColorGameScreenModule() -> UIViewController {
        let view = SelectColorGameViewController()
        let router = SelectColorGameRouter()
        
        view.router = router
        router.viewController = view
        
        return view
    }
}
