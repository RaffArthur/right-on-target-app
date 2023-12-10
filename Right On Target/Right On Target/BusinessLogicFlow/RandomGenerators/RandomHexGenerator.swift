//
//  RandomHexGenerator.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation

protocol RandomHexGenerator {
    func getRandomHex() -> String
}

final class RandomHexGeneratorImpl: RandomHexGenerator {
    func getRandomHex() -> String {
        let hexLetters = "0123456789ABCDEF"
        
        var hexColor = "#"
        
        for _ in 0..<6 {
            guard let randomHexLetter = hexLetters.randomElement() else { return String() }
            
            hexColor.append(randomHexLetter)
        }
        
        return hexColor
    }
}
