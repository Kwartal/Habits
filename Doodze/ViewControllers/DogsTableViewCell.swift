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
    private var firstImageView = UIImageView()
    private var secondImageView = UIImageView()
    private var thirdImageView = UIImageView()
    private var counterPeopleButton = UIButton()
    private var counterPeopleLabel = UILabel()
    private var confirmTheMeetingButton = UIButton()

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

        contentView.addSubviews(dateLabel, containerView)
        containerView.addSubviews(timeLabel, goalMeetingLabel, locationMeetingLabel, firstImageView, secondImageView, thirdImageView, counterPeopleButton, confirmTheMeetingButton)
        counterPeopleButton.addSubview(counterPeopleLabel)

        backgroundColor = UIColor(hexString: "FFFBF7")
        dateLabel.numberOfLines = 2
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10

        timeLabel.text = "14:00"
        timeLabel.textColor = .gray
        timeLabel.font = .systemFont(ofSize: 14, weight: .semibold)

        goalMeetingLabel.text = "Знакомим собачек :)"
        goalMeetingLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        goalMeetingLabel.textColor = .black

        locationMeetingLabel.text = "Площадка на Маяковской"
        locationMeetingLabel.font = .systemFont(ofSize: 16, weight: .regular)
        locationMeetingLabel.textColor = .gray

        firstImageView.image = UIImage(named: "a")
        firstImageView.layer.cornerRadius = 20
        firstImageView.layer.masksToBounds = true

        secondImageView.image = UIImage(named: "b")
        secondImageView.layer.cornerRadius = 20
        secondImageView.layer.masksToBounds = true

        thirdImageView.image = UIImage(named: "c")
        thirdImageView.layer.cornerRadius = 20
        thirdImageView.layer.masksToBounds = true

        counterPeopleButton.layer.cornerRadius = 20
        counterPeopleButton.layer.masksToBounds = true
        counterPeopleButton.backgroundColor = .white
        counterPeopleButton.layer.borderColor = UIColor.gray.cgColor
        counterPeopleButton.layer.borderWidth = 1

        counterPeopleLabel.text = "+8"
        counterPeopleLabel.font = .systemFont(ofSize: 16, weight: .regular)

        confirmTheMeetingButton.backgroundColor = UIColor(hexString: "DB7456")
//        confirmTheMeetingButton.layer.masksToBounds = true
        confirmTheMeetingButton.layer.cornerRadius = 20
        confirmTheMeetingButton.setTitle("Приду", for: .normal)

        configureConstraints()

    }

    func configureConstraints() {

        dateLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(120)
        }

        containerView.snp.makeConstraints {
            $0.leading.equalTo(dateLabel.snp.trailing).offset(22)
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

        firstImageView.snp.makeConstraints {
            $0.top.equalTo(locationMeetingLabel.snp.bottom).offset(8)
            $0.leading.equalTo(locationMeetingLabel)
            $0.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(40)
        }

        secondImageView.snp.makeConstraints {
            $0.top.equalTo(firstImageView)
            $0.leading.equalTo(firstImageView.snp.trailing).inset(4)
            $0.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(40)
        }

        thirdImageView.snp.makeConstraints {
            $0.top.equalTo(secondImageView)
            $0.leading.equalTo(secondImageView.snp.trailing).inset(4)
            $0.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(40)
        }

        counterPeopleButton.snp.makeConstraints {
            $0.top.equalTo(thirdImageView)
            $0.leading.equalTo(thirdImageView.snp.trailing).inset(4)
            $0.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(40)
        }

        counterPeopleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.top.bottom.trailing.equalToSuperview()
        }

        confirmTheMeetingButton.snp.makeConstraints {
            $0.top.equalTo(counterPeopleLabel)
            $0.leading.equalTo(counterPeopleLabel.snp.trailing).offset(50)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
    }

}

