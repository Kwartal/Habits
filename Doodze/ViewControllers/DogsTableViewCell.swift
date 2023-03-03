//
//  DogsTableViewCell.swift
//  Doodze
//
//  Created by Богдан Баринов on 01.03.2023.
//

import UIKit
import SnapKit

final class DogsTableViewCell: UITableViewCell, ClassIdentifiable {

    // MARK: - UI Elements

    private var dateLabel = UILabel()
    private var containerView = UIView()
    private var timeLabel = UILabel()
    private var goalMeetingLabel = UILabel()
    private var locationMeetingLabel = UILabel()
    private var arrayImages = [UIImage]()
    private var stackView = UIStackView()

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

    public func configure(with date: String, and images: [UIImage]) {
        dateLabel.text = date
        arrayImages = images

        for arrayImage in arrayImages {
            let testImageView = UIImageView()
//            testImageView.translatesAutoresizingMaskIntoConstraints = false

            testImageView.image = arrayImage
            stackView.addArrangedSubview(testImageView)
        }
    }

}

// MARK: - Layout

private extension DogsTableViewCell {

    func setupSubviews() {

        contentView.addSubviews(dateLabel, containerView)
        containerView.addSubviews(timeLabel, goalMeetingLabel, locationMeetingLabel, stackView)

        backgroundColor = .brown.withAlphaComponent(0.1)
        dateLabel.numberOfLines = 2
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10

        timeLabel.text = "14:00"
        timeLabel.textColor = .gray
        timeLabel.font = .systemFont(ofSize: 14, weight: .regular)

        goalMeetingLabel.text = "Знакомим собачек :)"
        goalMeetingLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        goalMeetingLabel.textColor = .black

        locationMeetingLabel.text = "Площадка на Маяковской"
        locationMeetingLabel.font = .systemFont(ofSize: 16, weight: .regular)
        locationMeetingLabel.textColor = .gray

//        stackView.backgroundColor = .red
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.distribution = .fillProportionally
//        stackView.spacing = 20
//        stackView.alignment = .fill
//        stackView.distribution = .fillEqually

        configureConstraints()

    }

    func configureConstraints() {

        dateLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(120)
        }

        containerView.snp.makeConstraints {
            $0.leading.equalTo(dateLabel.snp.trailing).offset(8)
            $0.top.equalTo(dateLabel)
            $0.trailing.bottom.equalToSuperview().inset(16)
        }

        timeLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16)
        }

        goalMeetingLabel.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(8)
            $0.leading.equalTo(timeLabel)
        }

        locationMeetingLabel.snp.makeConstraints {
            $0.top.equalTo(goalMeetingLabel.snp.bottom).offset(8)
            $0.leading.equalTo(goalMeetingLabel)
        }

        stackView.snp.makeConstraints {
            $0.top.equalTo(locationMeetingLabel.snp.bottom).offset(8)
            $0.leading.equalTo(locationMeetingLabel)
            $0.bottom.equalToSuperview().inset(8)

        }

    }

}

