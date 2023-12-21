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
        
        return button
    }()
    
    private lazy var secondColorButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var thirdColorButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var fourthColorButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var colorsStack: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 6
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    private lazy var hexValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    private lazy var hexValueChipsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        
        return view
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateLayoutForLandscape()
    }
}

private extension SelectColorGameView {
    func setupView() {
        setupLayout()
        setupContent()
    }
    
    func setupLayout() {
        add(subviews: [hexValueChipsView,
                       colorsStack])
        
        colorsStack.add(arrangedSubviews: [firstColorButton,
                                           secondColorButton,
                                           thirdColorButton,
                                           fourthColorButton])
        
        hexValueChipsView.addSubview(hexValueLabel)
        
        hexValueChipsView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview { $0.safeAreaLayoutGuide }.offset(20)
            make.height.equalTo(40)
            make.width.equalTo(hexValueLabel.snp.width).offset(20)
        }
        
        hexValueLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        colorsStack.snp.makeConstraints { make in
            make.top.equalTo(hexValueChipsView.snp.bottom).offset(12)
            
            make.leading.equalToSuperview {
                $0.safeAreaLayoutGuide
            }.offset(20)
            
            make.trailing.bottom.equalToSuperview {
                $0.safeAreaLayoutGuide
            }.offset(-20)
        }
    }
    
    func setupContent() {
        backgroundColor = .white
        
        [firstColorButton,
         secondColorButton,
         thirdColorButton,
         fourthColorButton].forEach {
            $0.configuration = .filled()
            $0.layer.cornerRadius = 16
            $0.layer.masksToBounds = true
            $0.layer.borderWidth = 4
            $0.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
            $0.contentMode = .scaleAspectFit
            $0.isPointerInteractionEnabled = true
        }
    }
}

private extension SelectColorGameView {
    func setupActions() {
        [firstColorButton,
         secondColorButton,
         thirdColorButton,
         fourthColorButton].forEach {
            $0.addTarget(self,
                         action: #selector(colorWasSelected),
                         for: .touchUpInside)
        }
    }
    
    @objc func colorWasSelected(sender: UIButton) {
        guard let colorHex = sender.configuration?.baseBackgroundColor?.getColorHex() else { return }
        
        delegate?.colorWasSelected(hex: colorHex)
    }
}

extension SelectColorGameView {
    func setIntendedHex(hex: String) {
        hexValueLabel.text = "Найди цвет: \(hex)"
    }
    
    func setHexColorsForButtons(hexes: [String]) {
        firstColorButton.configuration?.baseBackgroundColor = UIColor(hex: hexes[0])
        secondColorButton.configuration?.baseBackgroundColor = UIColor(hex: hexes[1])
        thirdColorButton.configuration?.baseBackgroundColor = UIColor(hex: hexes[2])
        fourthColorButton.configuration?.baseBackgroundColor = UIColor(hex: hexes[3])
    }
}

extension SelectColorGameView {
    func updateLayoutForLandscape() {
        if UIDevice.current.orientation.isLandscape {
            colorsStack.axis = .horizontal
        } else {
            colorsStack.axis = .vertical
        }
    }
}
