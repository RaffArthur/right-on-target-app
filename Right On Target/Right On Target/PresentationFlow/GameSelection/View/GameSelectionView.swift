//
//  GameSelectionView.swift
//  Right On Target
//
//  Created by Arthur Raff on 10.12.2023.
//

import Foundation
import UIKit

final class GameSelectionView: UIView {
    weak var delegate: GameSelectionViewDelegate?
    
    private lazy var gameSelectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выбери игру"
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var secretNumberGameButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Секретное число"
        config.titleAlignment = .center
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
            var text = $0
            text.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            
            return text
        }
        config.image = UIImage(systemName: "00.square.fill")?.withRenderingMode(.alwaysTemplate)
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 18, weight: .heavy)
        config.imagePadding = 8
        config.imagePlacement = .leading
        
        let button = UIButton(configuration: config)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.isPointerInteractionEnabled = true
        
        return button
    }()
    
    private lazy var selectColorGameButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Угадай цвет"
        config.titleAlignment = .center
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
            var text = $0
            text.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            
            return text
        }
        config.image = UIImage(systemName: "number.square.fill")?.withRenderingMode(.alwaysTemplate)
        config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 18, weight: .heavy)
        config.imagePadding = 8
        config.imagePlacement = .leading
        
        let button = UIButton(configuration: config)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.isPointerInteractionEnabled = true
        
        return button
    }()
    
    private lazy var gameSelectionStack: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fillEqually
        sv.spacing = 8
        sv.alignment = .fill
        sv.axis = .vertical
        
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        setupView()
    }
}

private extension GameSelectionView {
    func setupView() {
        setupLayout()
        setupContent()
    }
    
    func setupLayout() {
        add(subviews: [gameSelectionTitleLabel,
                       gameSelectionStack])
        
        gameSelectionStack.add(arrangedSubviews: [secretNumberGameButton,
                                                  selectColorGameButton])
        
        gameSelectionTitleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(gameSelectionStack.snp.top).offset(-24)
            make.centerX.equalTo(gameSelectionStack)
        }
        
        gameSelectionStack.snp.makeConstraints { make in
            make.center.equalToSuperview {
                $0.safeAreaLayoutGuide
            }
            
            make.leading.equalToSuperview {
                $0.safeAreaLayoutGuide
            }.offset(16)
            
            make.trailing.equalToSuperview {
                $0.safeAreaLayoutGuide
            }.offset(-16)
        }
        
        secretNumberGameButton.snp.makeConstraints { make in
            make.height.equalTo(140)
        }
    }
    
    func setupContent() {
        backgroundColor = .white
    }
}

private extension GameSelectionView {
    func setupActions() {
        secretNumberGameButton.addTarget(self,
                                         action: #selector(secretNumberGameButtonWasTapped),
                                         for: .touchUpInside)
        
        selectColorGameButton.addTarget(self,
                                        action: #selector(selectColorGameButtonWasTapped),
                                        for: .touchUpInside)
    }
    
    @objc func secretNumberGameButtonWasTapped() {
        delegate?.secretNumberGameButtonWasTapped()
    }
    
    @objc func selectColorGameButtonWasTapped() {
        delegate?.selectColorGameButtonWasTapped()
    }
}

extension GameSelectionView {
    func updateLayoutForLandscape() {
        if UIDevice.current.orientation.isLandscape {
            gameSelectionStack.axis = .horizontal
        } else {
            gameSelectionStack.axis = .vertical
        }
    }
}
