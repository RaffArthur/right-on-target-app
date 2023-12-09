//
//  GameService.swift
//  Right On Target
//
//  Created by Arthur Raff on 09.12.2023.
//

import Foundation

protocol GameService: AnyObject {
    func restartGame()
    func startNewRound()
    func calculateScoreWith(value: Int)
}
