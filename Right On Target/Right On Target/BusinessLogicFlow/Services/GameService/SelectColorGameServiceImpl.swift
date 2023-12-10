//
//  SelectColorGameServiceImpl.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation

final class SelectColorGameServiceImpl: GameService {
    private let randomHexGenerator = RandomHexGeneratorImpl()
    
    private var lastRound: Int
    private var currentRound: Int = 1
    
    var currentHexValue: String = ""
    var hexValues: [String] = []
    var score: Int = 0
    var isGameEnded: Bool { currentRound >= lastRound ? true : false }
    
    init?(rounds: Int) {
        lastRound = rounds
        
        getNewHexes()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }
    
    func startNewRound() {
        getNewHexes()
        currentRound += 1
    }
    
    func calculateScoreWith(value: Any) {
        guard let value = value as? String else { return }
        
        if value == currentHexValue {
            score += 1
        } else {
            score += 0
        }
    }
}

extension SelectColorGameServiceImpl {
    func getNewHexes() {
        hexValues.removeAll()
        
        for _ in 0..<4 {
            self.hexValues.append(randomHexGenerator.getRandomHex())
        }
        
        guard let randomHexValueFromHexValues = hexValues.randomElement() else { return }

        self.currentHexValue = randomHexValueFromHexValues
        
        print("\(hexValues) ---- \(currentHexValue)")

    }
}
