//
//  SetupCigaretteViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 09.11.2022.
//

import UIKit
import SnapKit


final class SetupCigaretteViewController: UIViewController {

    // MARK: - UI Elements

    private var dataView = UIView()
    private var selectDataLabel = UILabel()
    private var datePicker = UIDatePicker()

    private var quantityOfCigarettesView = UIView()
    private var cigarettePerDayLabel = UILabel()
    private var cigarettePerDayTextField = UITextField()

    private var packPriceView = UIView()
    private var packPriceLabel = UILabel()
    private var packPriceTextField = UITextField()

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

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))

        setupSubviews()
    }

    // MARK: - Actions

}

// MARK: - Layout

extension SetupCigaretteViewController {

    private func addSubviews() {
        view.addSubviews(dataView, quantityOfCigarettesView, packPriceView, doneButton)
        dataView.addSubviews(selectDataLabel, datePicker)

        quantityOfCigarettesView.addSubviews(cigarettePerDayLabel, cigarettePerDayTextField)

        packPriceView.addSubviews(packPriceLabel, packPriceTextField)
    }

    private func setupSubviews() {
        addSubviews()

        view.backgroundColor = UIColor(hexString: "EDEDED")

        dataView.backgroundColor = UIColor(hexString: "FFFFFF")
        dataView.layer.cornerRadius = 10
        dataView.layer.apply(.buttonDark)


        selectDataLabel.text = "Выберите дату"
        selectDataLabel.font = .systemFont(ofSize: 16, weight: .regular)
        selectDataLabel.textColor = UIColor(hexString: "000000")

        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.locale = datePicker.calendar.locale

        quantityOfCigarettesView.backgroundColor = UIColor(hexString: "FFFFFF")
        quantityOfCigarettesView.layer.cornerRadius = 10
        quantityOfCigarettesView.layer.apply(.buttonDark)

        cigarettePerDayLabel.text = "Сигареты / День"
        cigarettePerDayLabel.font = .systemFont(ofSize: 16, weight: .regular)
        cigarettePerDayLabel.textColor = UIColor(hexString: "000000")

        cigarettePerDayTextField.backgroundColor = UIColor(hexString: "EFEFF0")
        cigarettePerDayTextField.font = .systemFont(ofSize: 16, weight: .regular)
        cigarettePerDayTextField.text = UserDefaults.standard.string(forKey: "price")
        cigarettePerDayTextField.textColor = UIColor(hexString: "181818")
        cigarettePerDayTextField.layer.cornerRadius = 10
        cigarettePerDayTextField.delegate = self
        cigarettePerDayTextField.textAlignment = .center

        packPriceView.backgroundColor = UIColor(hexString: "FFFFFF")
        packPriceView.layer.cornerRadius = 10
        packPriceView.layer.apply(.buttonDark)


        packPriceLabel.text = "Цена / Пачка"
        packPriceLabel.font = .systemFont(ofSize: 16, weight: .regular)
        packPriceLabel.textColor = UIColor(hexString: "000000")

        packPriceTextField.backgroundColor = UIColor(hexString: "EFEFF0")
        packPriceTextField.font = .systemFont(ofSize: 16, weight: .regular)
        packPriceTextField.text = UserDefaults.standard.string(forKey: "price")
        packPriceTextField.textColor = UIColor(hexString: "181818")
        packPriceTextField.layer.cornerRadius = 10
        packPriceTextField.delegate = self
        packPriceTextField.textAlignment = .center

        doneButton.backgroundColor = UIColor(hexString: "BFF8E7")
        doneButton.layer.cornerRadius = 10
        doneButton.setTitle("Сохранить", for: .normal)
        doneButton.setTitleColor(Colors.text, for: .normal)
        doneButton.layer.apply(.buttonDark)
        doneButton.addTarget(self, action: #selector(doneSettingsDidTap), for: .touchUpInside)

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

        quantityOfCigarettesView.snp.makeConstraints {
            $0.top.equalTo(dataView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(60)
        }

        cigarettePerDayLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(quantityOfCigarettesView)
            $0.height.equalTo(21)
            $0.width.equalTo(151)
        }

        cigarettePerDayTextField.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(quantityOfCigarettesView)
            $0.height.equalTo(32)
            $0.width.equalTo(70)
        }

        packPriceView.snp.makeConstraints {
            $0.top.equalTo(quantityOfCigarettesView.snp.bottom).offset(27)
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
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(packPriceView)
            $0.height.equalTo(32)
            $0.width.equalTo(70)
        }

        doneButton.snp.makeConstraints {
            $0.top.equalTo(packPriceView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(60)
            $0.width.equalTo(151)
        }

    }

    @objc private func backButtonPressed() {
        let vc = MainTabBarViewController()
        present(vc, animated: false)
    }

    @objc private func doneSettingsDidTap() {
        doneButton.backgroundColor = .orange
    }

}

extension SetupCigaretteViewController {

    @objc private func stepperCigarettePerDayValueChanged() {
//        cigarettePerDayCounterLabel.text = String(format: "%.00f", cigarettePerDayStepper.value)
    }

    @objc private func stepperCigarettePerPackValueChanged() {
//        cigarettePerPackCounterLabel.text = String(format: "%.00f", cigarettePerPackStepper.value)
    }

}

extension SetupCigaretteViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile numer validation
        if textField == packPriceTextField {
            let allowedCharacters = CharacterSet(charactersIn:".0123456789")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }

}
