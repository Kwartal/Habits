//
//  DogsTableViewCell.swift
//  Doodze
//
//  Created by Богдан Баринов on 01.03.2023.
//

import UIKit

final class DogsTableViewCell: UITableViewCell, ClassIdentifiable {

    // MARK: - UI Elements

    private var dateLabel = UILabel()
    

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

    public func configure(with date: String) {
        dateLabel.text = date
    }

}

// MARK: - Layout

private extension DogsTableViewCell {

    func setupSubviews() {
        contentView.addSubviews(dateLabel)

        dateLabel.numberOfLines = 2

        configureConstraints()

    }

    func configureConstraints() {

        dateLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(90)
        }
    }

}

