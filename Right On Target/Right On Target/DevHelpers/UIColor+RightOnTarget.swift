//
//  UIColor+RightOnTarget.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat? = nil) {
        let rgbValue = CGFloat(255)
        
        self.init(red: r/rgbValue, green: g/rgbValue, blue: b/rgbValue, alpha: a ?? 1)
    }
    
    convenience init(rgba r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat? = nil) {
        let rgbValue = CGFloat(255)
        
        self.init(red: r/rgbValue, green: g/rgbValue, blue: b/rgbValue, alpha: a ?? 1)
    }
}

extension UIColor {
    convenience init?(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if (cString.count) != 6 {
            return nil
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
 
        self.init(r: CGFloat((rgbValue & 0xFF0000) >> 16),
                  g: CGFloat((rgbValue & 0x00FF00) >> 8),
                  b: CGFloat(rgbValue & 0x0000FF),
                  a: CGFloat(1.0))
    }
    
    func getColorHex() -> String {
        guard let components = self.cgColor.components,
              components.count >= 3
        else {
            return "#000000"
        }
        
        let r = components[0]
        let g = components[1]
        let b = components[2]
        
        return String(format: "#%02lX%02lX%02lX",
                      lroundf(Float(r * 255)),
                      lroundf(Float(g * 255)),
                      lroundf(Float(b * 255)))
    }
}
