//
//  SetupCoffeeViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 02.12.2022.
//

import UIKit

final class SetupCoffeeViewController: UIViewController, UITextFieldDelegate {

    // MARK: - UI Elements

    private var dataView = UIView()
    private var selectDataLabel = UILabel()
    private var datePicker = UIDatePicker()

    private var spendingPerMonthView = UIView()
    private var spendingPerMonthLabel = UILabel()
    private var spendingPerMonthTextField = UITextField()

    private var hoursPerDayView = UIView()
    private var hoursPerDayLabel = UILabel()
    private var hoursPerDayTextField = UITextField()

    private var doneButton = UIButton()


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

    @objc private func backButtonPressed() {
        self.dismiss(animated: true, completion: {
            let vc = MainTabBarViewController()

            self.present(vc, animated: true, completion: nil)
        })
    }
}

// MARK: - Layout

extension SetupCoffeeViewController {

    private func addSubviews() {
        view.addSubviews(dataView, spendingPerMonthView, doneButton, hoursPerDayView)
        dataView.addSubviews(selectDataLabel, datePicker)
        spendingPerMonthView.addSubviews(spendingPerMonthLabel, spendingPerMonthTextField)
        hoursPerDayView.addSubviews(hoursPerDayLabel, hoursPerDayTextField)
    }

    private func setupSubviews() {
        addSubviews()
        hideKeyboardWhenTappedAround()

        view.backgroundColor = UIColor(hexString: "EDEDED")

        dataView.backgroundColor = UIColor(hexString: "FFFFFF")
        dataView.layer.cornerRadius = 10
        dataView.layer.apply(.buttonDark)


        selectDataLabel.text = "Выберите дату"
        selectDataLabel.font = .systemFont(ofSize: 16, weight: .regular)
        selectDataLabel.textColor = .black

        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.locale = datePicker.calendar.locale

        spendingPerMonthView.backgroundColor = UIColor(hexString: "FFFFFF")
        spendingPerMonthView.layer.cornerRadius = 10
        spendingPerMonthView.layer.apply(.buttonDark)


        spendingPerMonthLabel.text = "Кружек / Неделя"
        spendingPerMonthLabel.font = .systemFont(ofSize: 16, weight: .regular)
        spendingPerMonthLabel.textColor = .black

        spendingPerMonthTextField.backgroundColor = UIColor(hexString: "EFEFF0")
        spendingPerMonthTextField.font = .systemFont(ofSize: 16, weight: .regular)
        spendingPerMonthTextField.text = UserDefaults.standard.string(forKey: "price")
        spendingPerMonthTextField.textColor = UIColor(hexString: "181818")
        spendingPerMonthTextField.layer.cornerRadius = 10
        spendingPerMonthTextField.delegate = self
        spendingPerMonthTextField.textAlignment = .center

        hoursPerDayView.backgroundColor = UIColor(hexString: "FFFFFF")
        hoursPerDayView.layer.cornerRadius = 10
        hoursPerDayView.layer.apply(.buttonDark)


        hoursPerDayLabel.text = "Траты / Неделя"
        hoursPerDayLabel.font = .systemFont(ofSize: 16, weight: .regular)
        hoursPerDayLabel.textColor = .black

        hoursPerDayTextField.backgroundColor = UIColor(hexString: "EFEFF0")
        hoursPerDayTextField.font = .systemFont(ofSize: 16, weight: .regular)
        hoursPerDayTextField.text = UserDefaults.standard.string(forKey: "price")
        hoursPerDayTextField.textColor = UIColor(hexString: "181818")
        hoursPerDayTextField.layer.cornerRadius = 10
        hoursPerDayTextField.delegate = self
        hoursPerDayTextField.textAlignment = .center

        doneButton.backgroundColor = UIColor(hexString: "BFF8E7")
        doneButton.layer.cornerRadius = 10
        doneButton.setTitle("Сохранить", for: .normal)
        doneButton.setTitleColor(Colors.text, for: .normal)
        doneButton.layer.apply(.buttonDark)

        configureConstraints()
    }

    private func configureConstraints() {

        dataView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalTo(view.center.x)
            $0.height.equalTo(60)
        }

        selectDataLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(dataView)
            $0.height.equalTo(21)
            $0.width.equalTo(151)
        }

        datePicker.snp.makeConstraints {
            $0.centerY.equalTo(dataView)
            $0.trailing.equalToSuperview().inset(16)
        }

        spendingPerMonthView.snp.makeConstraints {
            $0.top.equalTo(dataView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalTo(view.center.x)
            $0.height.equalTo(60)
        }

        spendingPerMonthLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(spendingPerMonthView)
            $0.height.equalTo(21)
            $0.width.equalTo(151)
        }

        spendingPerMonthTextField.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(spendingPerMonthView)
            $0.height.equalTo(32)
            $0.width.equalTo(70)
        }

        hoursPerDayView.snp.makeConstraints {
            $0.top.equalTo(spendingPerMonthView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalTo(view.center.x)
            $0.height.equalTo(60)
        }

        hoursPerDayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(hoursPerDayView)
            $0.height.equalTo(21)
            $0.width.equalTo(280)
        }

        hoursPerDayTextField.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(hoursPerDayView)
            $0.height.equalTo(32)
            $0.width.equalTo(70)
        }

        doneButton.snp.makeConstraints {
            $0.top.equalTo(hoursPerDayView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(60)
            $0.width.equalTo(151)
        }
    }
}
