//
//  SetupElectronicCigaretteViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 02.12.2022.
//

import UIKit

final class SetupElectronicCigaretteViewController: UIViewController, UITextFieldDelegate {

    // MARK: - UI Elements

    private var dataView = UIView()
    private var selectDataLabel = UILabel()
    private var datePicker = UIDatePicker()

    private var spendingPerWeekView = UIView()
    private var spendingPerWeekLabel = UILabel()
    private var spendingPerWeekTextField = UITextField()

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
        let vc = MainTabBarViewController()
        present(vc, animated: false)
    }
}

// MARK: - Layout

extension SetupElectronicCigaretteViewController {

    private func addSubviews() {
        view.addSubviews(dataView, spendingPerWeekView, doneButton)
        dataView.addSubviews(selectDataLabel, datePicker)
        spendingPerWeekView.addSubviews(spendingPerWeekLabel, spendingPerWeekTextField)
    }

    private func setupSubviews() {
        addSubviews()

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

        spendingPerWeekView.backgroundColor = UIColor(hexString: "FFFFFF")
        spendingPerWeekView.layer.cornerRadius = 10
        spendingPerWeekView.layer.apply(.buttonDark)


        spendingPerWeekLabel.text = "Траты в неделю"
        spendingPerWeekLabel.font = .systemFont(ofSize: 16, weight: .regular)
        spendingPerWeekLabel.textColor = .black

        spendingPerWeekTextField.backgroundColor = UIColor(hexString: "EFEFF0")
        spendingPerWeekTextField.font = .systemFont(ofSize: 16, weight: .regular)
        spendingPerWeekTextField.text = UserDefaults.standard.string(forKey: "price")
        spendingPerWeekTextField.textColor = UIColor(hexString: "181818")
        spendingPerWeekTextField.layer.cornerRadius = 10
        spendingPerWeekTextField.delegate = self
        spendingPerWeekTextField.textAlignment = .center

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

        spendingPerWeekView.snp.makeConstraints {
            $0.top.equalTo(dataView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerX.equalTo(view.center.x)
            $0.height.equalTo(60)
        }

        spendingPerWeekLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalTo(spendingPerWeekView)
            $0.height.equalTo(21)
            $0.width.equalTo(151)
        }

        spendingPerWeekTextField.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(spendingPerWeekView)
            $0.height.equalTo(32)
            $0.width.equalTo(70)
        }

        doneButton.snp.makeConstraints {
            $0.top.equalTo(spendingPerWeekView.snp.bottom).offset(27)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(60)
            $0.width.equalTo(151)
        }
    }

}
