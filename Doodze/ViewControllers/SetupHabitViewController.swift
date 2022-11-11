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
    private var priceOfPackView = UIView()
    private var cigarettePerPackLabel = UILabel()
    private var cigarettePerPackStepper = UIStepper()
    private var cigarettePerPackView = UIView()
    private var cigarettePerPackCounterLabel = UILabel()



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
        view.addSubviews(aboutMeView, quantityOfCigarettesView, priceOfPackView)
        aboutMeView.addSubviews(selectDataLabel, datePicker)

        quantityOfCigarettesView.addSubviews(cigarettePerDayLabel, cigarettePerDayStepper, cigarettePerDayView)
        cigarettePerDayView.addSubview(cigarettePerDayCounterLabel)

        priceOfPackView.addSubviews(cigarettePerPackStepper, cigarettePerPackView, cigarettePerPackLabel)
        cigarettePerPackView.addSubview(cigarettePerPackCounterLabel)
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

        quantityOfCigarettesView.backgroundColor = UIColor(hexString: "FFFFFF")
        quantityOfCigarettesView.layer.cornerRadius = 10

        cigarettePerDayLabel.text = "Сигареты / День"
        cigarettePerDayLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        cigarettePerDayLabel.textColor = .black

        cigarettePerDayStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)

        cigarettePerDayView.backgroundColor = UIColor(hexString: "EFEFF0")
        cigarettePerDayView.layer.cornerRadius = 10

        cigarettePerDayCounterLabel.textColor = .black
        cigarettePerDayCounterLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        cigarettePerDayCounterLabel.backgroundColor = UIColor(hexString: "EDEDED")
        cigarettePerDayCounterLabel.text = "0"
        cigarettePerDayCounterLabel.textAlignment = .center
        cigarettePerDayCounterLabel.layer.cornerRadius = 10

        priceOfPackView.backgroundColor = UIColor(hexString: "FFFFFF")
        priceOfPackView.layer.cornerRadius = 10
        priceOfPackView.layer.apply(.buttonDark)

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
            $0.height.equalTo(30)
            $0.width.equalTo(50)
        }

        cigarettePerDayCounterLabel.snp.makeConstraints {
            $0.centerY.centerX.equalTo(cigarettePerDayView)
        }

        priceOfPackView.snp.makeConstraints {
            $0.top.equalTo(quantityOfCigarettesView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalTo(view.center.x)
            $0.height.equalTo(60)
        }

    }

    @objc private func backButtonPressed() {
        let vc = MainTabBarViewController()
        present(vc, animated: false)
    }

}

extension SetupHabitViewController {

    @objc private func stepperValueChanged(sender: UIButton) {
        cigarettePerDayCounterLabel.text = String(format: "%.00f", cigarettePerDayStepper.value)
    }

}
