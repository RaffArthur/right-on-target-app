//
//  UIView+AddSubviews.swift
//  Right On Target
//
//  Created by Arthur Raff on 03.12.2023.
//

import Foundation
import UIKit

extension UIView {
    func add(subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}
