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
    private var quantityOfCigarettesView = UIView()
    private var cigarettePerDayLabel = UILabel()
    private var cigarettePerDayStepper = UIStepper()
    private var cigarettePerDayView = UIView()
    private var cigarettePerDayCounterLabel = UILabel()
    private var cigaretteInPackView = UIView()
    private var cigarettePerPackLabel = UILabel()
    private var cigarettePerPackStepper = UIStepper()
    private var cigarettePerPackCounterView = UIView()
    private var cigarettePerPackCounterLabel = UILabel()
    private var packPriceView = UIView()
    private var packPriceLabel = UILabel()
    private var packPriceTextField = UITextField()
    private var currencyView = UIView()
    private var currencyLabel = UILabel()


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
        view.addSubviews(aboutMeView, quantityOfCigarettesView, cigaretteInPackView, packPriceView, currencyView)
        aboutMeView.addSubviews(selectDataLabel, datePicker)

        quantityOfCigarettesView.addSubviews(cigarettePerDayLabel, cigarettePerDayStepper, cigarettePerDayView)
        cigarettePerDayView.addSubview(cigarettePerDayCounterLabel)

        cigaretteInPackView.addSubviews(cigarettePerPackStepper, cigarettePerPackCounterView, cigarettePerPackLabel)
        cigarettePerPackCounterView.addSubview(cigarettePerPackCounterLabel)
        packPriceView.addSubviews(packPriceLabel, packPriceTextField)
        currencyView.addSubviews(currencyLabel)
    }

    private func setupSubviews() {
        addSubviews()

        view.backgroundColor = UIColor(hexString: "EDEDED")

        aboutMeView.backgroundColor = UIColor(hexString: "FFFFFF")
        aboutMeView.layer.cornerRadius = 10

        selectDataLabel.text = "Выберите дату"
        selectDataLabel.font = .systemFont(ofSize: 16, weight: .regular)
        selectDataLabel.textColor = .black

        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.locale = datePicker.calendar.locale

        quantityOfCigarettesView.backgroundColor = UIColor(hexString: "FFFFFF")
        quantityOfCigarettesView.layer.cornerRadius = 10
        quantityOfCigarettesView.layer.apply(.buttonDark)

        cigarettePerDayLabel.text = "Сигареты / День"
        cigarettePerDayLabel.font = .systemFont(ofSize: 16, weight: .regular)
        cigarettePerDayLabel.textColor = .black

        cigarettePerDayStepper.addTarget(self, action: #selector(stepperCigarettePerDayValueChanged), for: .valueChanged)

        cigarettePerDayView.backgroundColor = UIColor(hexString: "EFEFF0")
        cigarettePerDayView.layer.cornerRadius = 10

        cigarettePerDayCounterLabel.textColor = .black
        cigarettePerDayCounterLabel.font = .systemFont(ofSize: 16, weight: .regular)
        cigarettePerDayCounterLabel.backgroundColor = UIColor(hexString: "EDEDED")
        cigarettePerDayCounterLabel.text = "0"
        cigarettePerDayCounterLabel.textAlignment = .center
        cigarettePerDayCounterLabel.layer.cornerRadius = 10

        cigaretteInPackView.backgroundColor = UIColor(hexString: "FFFFFF")
        cigaretteInPackView.layer.cornerRadius = 10
        cigaretteInPackView.layer.apply(.buttonDark)

        cigarettePerPackLabel.text = "Сигареты / Пачка"
        cigarettePerPackLabel.font = .systemFont(ofSize: 16, weight: .regular)
        cigarettePerPackLabel.textColor = .black

        cigarettePerPackStepper.addTarget(self, action: #selector(stepperCigarettePerPackValueChanged), for: .valueChanged)
        cigarettePerPackStepper.backgroundColor = .red

        cigarettePerPackCounterView.backgroundColor = UIColor(hexString: "EFEFF0")
        cigarettePerPackCounterView.layer.cornerRadius = 10

        cigarettePerPackCounterLabel.textColor = .black
        cigarettePerPackCounterLabel.font = .systemFont(ofSize: 16, weight: .regular)
        cigarettePerPackCounterLabel.backgroundColor = UIColor(hexString: "EDEDED")
        cigarettePerPackCounterLabel.text = "0"
        cigarettePerPackCounterLabel.textAlignment = .center
        cigarettePerPackCounterLabel.layer.cornerRadius = 10

        packPriceView.backgroundColor = UIColor(hexString: "FFFFFF")
        packPriceView.layer.cornerRadius = 10
        packPriceView.layer.apply(.buttonDark)


        packPriceLabel.text = "Цена / Пачка"
        packPriceLabel.font = .systemFont(ofSize: 16, weight: .regular)
        packPriceLabel.textColor = .black

        packPriceTextField.backgroundColor = UIColor(hexString: "EFEFF0")
        packPriceTextField.font = .systemFont(ofSize: 16, weight: .regular)
        packPriceTextField.text = UserDefaults.standard.string(forKey: "price")
        packPriceTextField.textColor = UIColor(hexString: "181818")
        packPriceTextField.layer.cornerRadius = 10


        currencyView.backgroundColor = UIColor(hexString: "FFFFFF")
        currencyView.layer.cornerRadius = 10
        currencyView.layer.apply(.buttonDark)

        currencyLabel.text = "Валюта"
        currencyLabel.font = .systemFont(ofSize: 16, weight: .regular)
        currencyLabel.textColor = .black


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
            $0.leading.equalToSuperview().offset(200)
        }

        quantityOfCigarettesView.snp.makeConstraints {
            $0.top.equalTo(aboutMeView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(60)
        }

        cigarettePerDayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(quantityOfCigarettesView)
            $0.height.equalTo(21)
            $0.width.equalTo(151)
        }

        cigarettePerDayStepper.snp.makeConstraints {
            $0.centerY.equalTo(quantityOfCigarettesView)
            $0.leading.equalToSuperview().offset(200)
        }

        cigarettePerDayView.snp.makeConstraints {
            $0.leading.equalTo(cigarettePerDayStepper.snp.trailing).offset(8)
            $0.centerY.equalTo(quantityOfCigarettesView)
            $0.height.equalTo(32)
            $0.width.equalTo(50)
        }

        cigarettePerDayCounterLabel.snp.makeConstraints {
            $0.centerY.centerX.equalTo(cigarettePerDayView)
        }

        cigaretteInPackView.snp.makeConstraints {
            $0.top.equalTo(quantityOfCigarettesView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalTo(view.center.x)
            $0.height.equalTo(60)
        }

        cigarettePerPackLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(cigaretteInPackView)
            $0.height.equalTo(21)
            $0.width.equalTo(151)
        }

        cigarettePerPackCounterView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
//            $0.centerY.equalTo(cigaretteInPackView)
            $0.height.equalTo(32)
            $0.width.equalTo(50)
        }

        // FIXME: - Исправить констрейнты
        cigarettePerPackStepper.snp.makeConstraints {
            $0.centerY.equalTo(cigaretteInPackView)
            $0.trailing.equalTo(cigarettePerPackCounterView.snp.leading).inset(8)
        }

        cigarettePerPackCounterLabel.snp.makeConstraints {
            $0.centerY.centerX.equalTo(cigarettePerPackCounterView)
        }

        packPriceView.snp.makeConstraints {
            $0.top.equalTo(cigaretteInPackView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalTo(view.center.x)
            $0.height.equalTo(60)
        }

        packPriceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(packPriceView)
            $0.height.equalTo(21)
            $0.width.equalTo(151)
        }

        packPriceTextField.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(32)
            $0.centerY.equalTo(packPriceView)
            $0.height.equalTo(32)
            $0.width.equalTo(70)
        }

        currencyView.snp.makeConstraints {
            $0.top.equalTo(packPriceView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalTo(view.center.x)
            $0.height.equalTo(60)
        }

        currencyLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(currencyView)
            $0.height.equalTo(21)
            $0.width.equalTo(151)
        }

    }

    @objc private func backButtonPressed() {
        let vc = MainTabBarViewController()
        present(vc, animated: false)
    }

}

extension SetupHabitViewController {

    @objc private func stepperCigarettePerDayValueChanged() {
        cigarettePerDayCounterLabel.text = String(format: "%.00f", cigarettePerDayStepper.value)
    }

    @objc private func stepperCigarettePerPackValueChanged() {
        cigarettePerPackCounterLabel.text = String(format: "%.00f", cigarettePerPackStepper.value)
    }

}
