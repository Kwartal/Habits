//
//  TimerTableViewCell.swift
//  Doodze
//
//  Created by Богдан Баринов on 02.11.2022.
//

import UIKit
import SnapKit

final class TimerTableViewCell: UITableViewCell, ClassIdentifiable {
    
    // MARK: - UI Elements
    
    private var timerImageView = UIImageView()
    private var timerNameLabel = UILabel()
    private var timerDiscriptionLabel = UILabel()
    private var backingView = UIView()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 18, bottom: 32, right: 18))
    }
    
    public func configure(timer: Timer, color: UIColor) {
        backingView.backgroundColor = color
        
        timerImageView.image = UIImage(named: timer.imageName)
        timerNameLabel.text = timer.name
        timerDiscriptionLabel.text = timer.description
    }
    
    
    
}

// MARK: - Layout

extension TimerTableViewCell {
    
    private func setupSubviews() {
        contentView.addSubviews(backingView, timerImageView, timerNameLabel, timerDiscriptionLabel)
        
        contentView.layer.cornerRadius = 25
        backgroundColor = .clear
        
        timerImageView.layer.cornerRadius = 25
        timerImageView.clipsToBounds = false
        timerImageView.contentMode = .scaleAspectFill
        timerNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        timerNameLabel.textAlignment = .left
        
        timerDiscriptionLabel.font = .systemFont(ofSize: 18, weight: .regular)
        timerDiscriptionLabel.numberOfLines = 0
        
        backingView.layer.cornerRadius = 25
        
        configureConstraints()
        
    }
    
    private func configureConstraints() {
        
        timerImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(32)
            $0.width.greaterThanOrEqualTo(120)
        }
        
        timerNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(170)
            
            $0.top.equalToSuperview().offset(32)
            
        }
        
        timerDiscriptionLabel.snp.makeConstraints {
            $0.top.equalTo(timerNameLabel.snp.bottom)
            $0.leading.equalTo(timerNameLabel)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        backingView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
            
        }
    }
    
}
