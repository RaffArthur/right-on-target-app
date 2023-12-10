//
//  SelectColorGameDelegates.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation

protocol SelectColorGameViewDelegate: AnyObject {
    func colorWasSelected(hex: String)
}
