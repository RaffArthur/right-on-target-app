//
//  SecretNumberGameServiceImpl.swift
//  Right On Target
//
//  Created by Arthur Raff on 09.12.2023.
//

import Foundation

final class SecretNumberGameServiceImpl: SecretNumberGameService {
    private let randomNumberGenerator = RandomNumberGeneratorImpl(startValue: 1, endValue: 50)
    
    private var minSecretValue: Int
    private var maxSecretValue: Int
    private var lastRound: Int
    
    var score: Int = 0
    var currentSecretValue: Int = 0
    private var currentRound: Int = 1

    var isGameEnded: Bool { currentRound >= lastRound ? true : false }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue else { return nil }
        
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = randomNumberGenerator?.getRandomNumber() ?? 0
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        currentSecretValue = randomNumberGenerator?.getRandomNumber() ?? 0
        currentRound += 1
    }
    
    func calculateScoreWith(value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
