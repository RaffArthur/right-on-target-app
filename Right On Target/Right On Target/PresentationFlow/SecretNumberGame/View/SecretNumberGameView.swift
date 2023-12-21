//
//  SecretNumberGameView.swift
//  Right On Target
//
//  Created by Arthur Raff on 03.12.2023.
//

import Foundation
import UIKit

final class SecretNumberGameView: UIView {
    weak var delegate: SecretNumberGameViewDelegate?
    
    private lazy var numberPositionSlider: UISlider = {
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .heavy)
        let slider = UISlider()
        slider.tintColor = .systemIndigo
        slider.minimumValueImage = UIImage(systemName: "1.circle.fill")?
            .withRenderingMode(.alwaysTemplate)
            .withConfiguration(symbolConfig)
        slider.maximumValueImage = UIImage(systemName: "50.circle.fill")?
            .withRenderingMode(.alwaysTemplate)
            .withConfiguration(symbolConfig)
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.setValue(25, animated: true)
        
        return slider
    }()
    
    private lazy var checkNumberButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Проверить"
        config.titleAlignment = .center
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
            var text = $0
            text.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            text.foregroundColor = UIColor.white
            
            return text
        }
        config.baseBackgroundColor = .systemIndigo
        
        let button = UIButton(configuration: config)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.isPointerInteractionEnabled = true
        
        return button
    }()
    
    private lazy var secretNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    private lazy var secretNumberChipsView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        
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

private extension SecretNumberGameView {
    func setupView() {
        setupLayout()
        setupContent()
    }
    
    func setupLayout() {
        add(subviews: [secretNumberChipsView,
                       numberPositionSlider,
                       checkNumberButton])
        
        secretNumberChipsView.addSubview(secretNumberLabel)
        
        secretNumberLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        secretNumberChipsView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview { $0.safeAreaLayoutGuide }.offset(20)
            make.height.equalTo(40)
            make.width.equalTo(secretNumberLabel.snp.width).offset(20)
        }
        
        numberPositionSlider.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview { $0.safeAreaLayoutGuide }.offset(20)
            make.trailing.equalToSuperview { $0.safeAreaLayoutGuide }.offset(-20)
        }
        
        checkNumberButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(numberPositionSlider.snp.bottom).offset(40)
            make.width.equalTo(180)
            make.height.equalTo(60)
        }
    }
    
    func setupContent() {
        backgroundColor = .white
    }
}

private extension SecretNumberGameView {
    @objc func checkintentedNumber() {
        delegate?.secretNumberWasChecked()
    }
    
    func setupActions() {
        checkNumberButton.addTarget(self, action: #selector(checkintentedNumber), for: .touchUpInside)
    }
}

extension SecretNumberGameView {
    func setCheckNumberButtonTitle(title: String) {
        checkNumberButton.setTitle(title, for: .normal)
    }
    
    func setIntentedNumber(number: String) {
        secretNumberLabel.text = "Найди число: \(number)"
    }
    
    func getNumberPositionOnSliderValue() -> Int {
        return Int(numberPositionSlider.value.rounded())
    }
    
    func resetSliderValue() {
        numberPositionSlider.setValue(25, animated: true)
    }
}
