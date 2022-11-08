//
//  BadHabitTableViewCell.swift
//  Doodze
//
//  Created by Богдан Баринов on 02.11.2022.
//

import UIKit
import SnapKit

final class BadHabitTableViewCell: UITableViewCell, ClassIdentifiable {
    // MARK: - UI Elements

    private var badHabitImageView = UIImageView()
    private var nameLabel = UILabel()
    private var badHabitDiscriptionLabel = UILabel()
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

    public func configure(badHabbit: BadHabit, color: UIColor) {
        backingView.backgroundColor = color

        badHabitImageView.image = UIImage(named: badHabbit.imageName)
        nameLabel.text = badHabbit.name
        badHabitDiscriptionLabel.text = badHabbit.description
    }
}

// MARK: - Layout

extension BadHabitTableViewCell {
    private func setupSubviews() {
        contentView.addSubviews(backingView, badHabitImageView, nameLabel, badHabitDiscriptionLabel)

        contentView.layer.cornerRadius = 25
        backgroundColor = .clear

        badHabitImageView.layer.cornerRadius = 25
        badHabitImageView.clipsToBounds = false
        badHabitImageView.contentMode = .scaleAspectFill
        
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.textAlignment = .left

        badHabitDiscriptionLabel.font = .systemFont(ofSize: 18, weight: .regular)
        badHabitDiscriptionLabel.numberOfLines = 0

        backingView.layer.cornerRadius = 25

        configureConstraints()
    }

    private func configureConstraints() {
        badHabitImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(32)
            $0.width.greaterThanOrEqualTo(120)
        }

        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(170)

            $0.top.equalToSuperview().offset(32)
        }

        badHabitDiscriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
            $0.height.lessThanOrEqualTo(100)
        }

        backingView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
