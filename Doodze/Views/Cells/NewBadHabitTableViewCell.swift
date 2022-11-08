//
//  NewBadHabitTableViewCell.swift
//  Doodze
//
//  Created by Богдан Баринов on 08.11.2022.
//

import UIKit

final class NewBadHabitTableViewCell: UITableViewCell, ClassIdentifiable {
    // MARK: - UI Elements

    private var nameLabel = UILabel()
    private var backingView = UIView()
    private var badHabitImageView = UIImageView()

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
    }
}

// MARK: - Layout

extension NewBadHabitTableViewCell {
    private func setupSubviews() {
        contentView.addSubviews(backingView, nameLabel, badHabitImageView)

        contentView.layer.cornerRadius = 25
        backgroundColor = .clear

        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.textAlignment = .left

        backingView.layer.cornerRadius = 25

        configureConstraints()
    }

    private func configureConstraints() {

        badHabitImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }

        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(badHabitImageView.snp.trailing).offset(16)
            $0.top.equalToSuperview().offset(32)
        }

        backingView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
