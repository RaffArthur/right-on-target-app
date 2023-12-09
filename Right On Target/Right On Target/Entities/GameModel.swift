//
//  GameModel.swift
//  Right On Target
//
//  Created by Arthur Raff on 09.12.2023.
//

import Foundation

struct GameModel: Codable {
    let score: Int?
    let currentRound: Int?
    let currentSecretValue: Int?
    let isGameEnded: Bool?
}
