//
//  SetupHabitViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 09.11.2022.
//

import UIKit
import SnapKit


final class SetupHabitViewController: UIViewController {

    // MARK: - UI Elements

    private var aboutMeView = UIView()
    private var selectDataLabel = UILabel()
    private var datePicker = UIDatePicker()
    private var numberCigaretteView = UIView()
    private var howCigaretteLabel = UILabel()
    private var itemCounterView = UIView()
    private var minusNumberOfItemButton = UIButton()
    private var plusNumberOfItemButton = UIButton()
    private var currentNumberItemLabel = UILabel()


    // MARK: - Lifecycle

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))

        setupSubviews()
    }

    // MARK: - Actions

}

// MARK: - Layout

extension SetupHabitViewController {

    private func addSubviews() {
        view.addSubviews(aboutMeView, numberCigaretteView)
        aboutMeView.addSubviews(selectDataLabel, datePicker)
        numberCigaretteView.addSubviews(howCigaretteLabel, itemCounterView)
        itemCounterView.addSubviews(minusNumberOfItemButton, currentNumberItemLabel, plusNumberOfItemButton)
    }

    private func setupSubviews() {
        addSubviews()

        view.backgroundColor = UIColor(hexString: "EDEDED")

        aboutMeView.backgroundColor = UIColor(hexString: "FFFFFF")
        aboutMeView.layer.cornerRadius = 10

        selectDataLabel.text = "Выберите дату"
        selectDataLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        selectDataLabel.textColor = .black

        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.locale = datePicker.calendar.locale
        datePicker.preferredDatePickerStyle = .automatic

        numberCigaretteView.backgroundColor = UIColor(hexString: "FFFFFF")
        numberCigaretteView.layer.cornerRadius = 10

        howCigaretteLabel.text = "Сигареты / День"
        howCigaretteLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        howCigaretteLabel.textColor = .black


        itemCounterView.backgroundColor = .gray.withAlphaComponent(0.1)
        itemCounterView.layer.cornerRadius = 20


        minusNumberOfItemButton.setTitle("-", for: .normal)
        minusNumberOfItemButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .regular)
        minusNumberOfItemButton.addTarget(self, action: #selector(numbersOfItemButtonDidTap(sender:)), for: .touchUpInside)

        plusNumberOfItemButton.setTitle("+", for: .normal)
        plusNumberOfItemButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .regular)
        plusNumberOfItemButton.setTitleColor(.black, for: .normal)
        plusNumberOfItemButton.addTarget(self, action: #selector(numbersOfItemButtonDidTap(sender:)), for: .touchUpInside)

        currentNumberItemLabel.text = "1"
        currentNumberItemLabel.textColor = .white
        currentNumberItemLabel.font = .systemFont(ofSize: 20, weight: .bold)
        currentNumberItemLabel.textAlignment = .center

        configureConstraints()
    }

    private func configureConstraints() {

        aboutMeView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalTo(view.center.x)
            $0.height.equalTo(60)
        }

        selectDataLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(aboutMeView)
            $0.height.equalTo(21)
            $0.width.equalTo(151)
        }

        datePicker.snp.makeConstraints {
            $0.centerY.equalTo(aboutMeView)
            $0.trailing.equalToSuperview().inset(16)
        }

        numberCigaretteView.snp.makeConstraints {
            $0.top.equalTo(aboutMeView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalTo(view.center.x)
            $0.height.equalTo(60)
        }

        howCigaretteLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(numberCigaretteView)
            $0.height.equalTo(21)
            $0.width.equalTo(151)
        }

        itemCounterView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(numberCigaretteView)
            $0.height.equalTo(45)
            $0.width.equalTo(90)
        }

        plusNumberOfItemButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalTo(numberCigaretteView)
            $0.size.equalTo(30)
        }

        currentNumberItemLabel.snp.makeConstraints {
            $0.trailing.equalTo(plusNumberOfItemButton.snp.leading).offset(6)
            $0.centerY.equalTo(numberCigaretteView)
            $0.size.equalTo(30)
        }

        minusNumberOfItemButton.snp.makeConstraints {
            $0.trailing.equalTo(currentNumberItemLabel.snp.leading).offset(6)
            $0.centerY.equalTo(numberCigaretteView)
            $0.size.equalTo(30)
        }

    }

    @objc private func backButtonPressed() {
        let vc = MainTabBarViewController()
        present(vc, animated: false)
    }

}

extension SetupHabitViewController {

    @objc private func numbersOfItemButtonDidTap(sender: UIButton) {
        guard var currentValue = Int(currentNumberItemLabel.text ?? "0") else { return }

        if sender == minusNumberOfItemButton && currentValue > 0 {
            currentValue -= 1
        } else if sender == plusNumberOfItemButton {
            currentValue += 1
        } else if currentValue == 0 {
            currentNumberItemLabel.textColor = .gray.withAlphaComponent(0.3)
        }
        currentNumberItemLabel.text = String(currentValue)
    }

}
