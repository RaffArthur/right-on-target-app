//
//  GameView.swift
//  Right On Target
//
//  Created by Arthur Raff on 03.12.2023.
//

import Foundation
import UIKit

final class GameView: UIView {
    private lazy var numberPositionSlider: UISlider = {
        let slider = UISlider()
        slider.tintColor = .systemIndigo
        slider.minimumValueImage = UIImage(systemName: "01.square.fill")
        slider.maximumValueImage = UIImage(systemName: "50.square.fill")
        
        return slider
    }()
    
    private lazy var checkNumberButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.setTitle("Проверить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    private lazy var intentedNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .systemFont(ofSize: 16, weight: .heavy)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension GameView {
    func setupView() {
        setupLayout()
        setupContent()
    }
    
    func setupLayout() {
        add(subviews: [numberPositionSlider,
                       checkNumberButton,
                       intentedNumberLabel])
        
        numberPositionSlider.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview { $0.safeAreaLayoutGuide }.offset(20)
            make.trailing.equalToSuperview { $0.safeAreaLayoutGuide }.offset(-20)
        }
        
        checkNumberButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(numberPositionSlider.snp.bottom).offset(20)
        }
        
        intentedNumberLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(checkNumberButton.snp.bottom).offset(20)
        }
    }
    
    func setupContent() {
        backgroundColor = .white
    }
}
