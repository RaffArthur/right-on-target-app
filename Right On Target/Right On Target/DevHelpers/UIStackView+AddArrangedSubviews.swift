//
//  UIStackView+AddArrangedSubviews.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation
import UIKit

extension UIStackView {
    func add(arrangedSubviews: [UIView]) {
        arrangedSubviews.forEach { addArrangedSubview($0) }
    }
}
