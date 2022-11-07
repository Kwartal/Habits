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

        nameLabel.text = badHabbit.name
    }

}

// MARK: - Layout

extension NewBadHabitTableViewCell {

    private func setupSubviews() {
        contentView.addSubviews(backingView, nameLabel)

        contentView.layer.cornerRadius = 25
        backgroundColor = .clear

        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.textAlignment = .left

        backingView.layer.cornerRadius = 25

        configureConstraints()

    }

    private func configureConstraints() {

        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(170)

            $0.top.equalToSuperview().offset(32)

        }

        backingView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.trailing.bottom.equalToSuperview()

        }
    }

}
