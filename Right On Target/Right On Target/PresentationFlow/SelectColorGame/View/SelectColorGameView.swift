//
//  SelectColorGameView.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation
import UIKit

final class SelectColorGameView: UIView {
    weak var delegate: SelectColorGameViewDelegate?
    
    private lazy var firstColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        
        return button
    }()
    
    private lazy var secondColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        
        return button
    }()
    
    private lazy var thirdColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor

        return button
    }()
    
    private lazy var fourthColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor

        return button
    }()
    
    private lazy var colorsStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 6
        
        return sv
    }()
    
    private lazy var hexValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .systemGray5
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    private lazy var colorContainer: UIView = {
        let view = UIView()
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SelectColorGameView {
    func setupView() {
        setupLayout()
        setupContent()
    }
    
    func setupLayout() {
        add(subviews: [hexValueLabel,
                       colorsStack])
        
        colorsStack.add(arrangedSubviews: [firstColorButton,
                                           secondColorButton,
                                           thirdColorButton,
                                           fourthColorButton])
                
        hexValueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            
            make.height.equalTo(40)
            make.width.equalTo(120)
            
            make.top.equalToSuperview {
                $0.safeAreaLayoutGuide
            }.offset(24)
        }
        
        colorsStack.snp.makeConstraints { make in
            make.top.equalTo(hexValueLabel.snp.bottom).offset(12)
            
            make.leading.equalToSuperview {
                $0.safeAreaLayoutGuide
            }.offset(16)
            
            make.trailing.equalToSuperview {
                $0.safeAreaLayoutGuide
            }.offset(-16)
            
            make.bottom.equalToSuperview {
                $0.safeAreaLayoutGuide
            }.offset(-24)
        }
    }
    
    func setupContent() {
        backgroundColor = .white
    }
}

private extension SelectColorGameView {
    func setupActions() {
        [firstColorButton,
         secondColorButton,
         thirdColorButton,
         fourthColorButton].forEach { $0.addTarget(self,
                                                   action: #selector(colorWasSelected),
                                                   for: .touchUpInside)}
    }
    
    @objc func colorWasSelected(sender: UIButton) {
        delegate?.colorWasSelected(hex: (sender.backgroundColor?.getColorHex())!)
    }
}

extension SelectColorGameView {
    func setIntendedHex(hex: String) {
        hexValueLabel.text = "HEX: \(hex)"
    }
    
    func setHexColorsForButtons(hexes: [String]) {
        firstColorButton.backgroundColor = UIColor(hex: hexes[0])
        secondColorButton.backgroundColor = UIColor(hex: hexes[1])
        thirdColorButton.backgroundColor = UIColor(hex: hexes[2])
        fourthColorButton.backgroundColor = UIColor(hex: hexes[3])
    }
}
