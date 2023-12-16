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
        let button = UIButton()
        button.setTitle("Угадай число", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setImage(UIImage(systemName: "00.circle.fill"), for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private lazy var selectColorGameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Угадай цвет", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setImage(UIImage(systemName: "number.circle.fill"), for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
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
}

private extension GameSelectionView {
    func setupView() {
        setupLayout()
        setupContent()
    }
    
    func setupLayout() {
        addSubview(gameSelectionStack)
        
        gameSelectionStack.add(arrangedSubviews: [gameSelectionTitleLabel,
                                                  secretNumberGameButton,
                                                  selectColorGameButton])
        
        gameSelectionStack.setCustomSpacing(16, after: gameSelectionTitleLabel)
        
        gameSelectionStack.snp.makeConstraints { make in
            make.center.equalToSuperview {
                $0.safeAreaLayoutGuide
            }
        }
        
        secretNumberGameButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(280)
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
