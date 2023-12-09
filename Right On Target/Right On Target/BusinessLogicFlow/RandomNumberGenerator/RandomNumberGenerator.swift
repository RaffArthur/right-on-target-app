//
//  RandomNumberGenerator.swift
//  Right On Target
//
//  Created by Arthur Raff on 09.12.2023.
//

import Foundation

protocol RandomNumberGenerator {
    func getRandomNumber() -> Int
}

final class RandomNumberGeneratorImpl: RandomNumberGenerator {
    private let startRangeValue: Int
    private let endRangeValue: Int
    
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else {
            return nil
        }
        
        startRangeValue = startValue
        endRangeValue = endValue
    }
    
    func getRandomNumber() -> Int {        
        return (startRangeValue...endRangeValue).randomElement() ?? 0
    }
}
