//
//  SelectColorGameProtocols.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation
import UIKit

protocol SelectColorGameViewDelegate: AnyObject {
    func colorWasSelected(hex: String)
}

protocol SelectColorGameScreenRouter: AnyObject {
    func showAlertWith(message: String, title: String?)
}

protocol SelectColorGameFactory: AnyObject {
    func createSelectColorGameScreenModule() -> UIViewController
}
