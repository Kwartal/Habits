//
//  ProfileViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 01.11.2022.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    // MARK: - UI Elements

    private var scrollView = UIScrollView()
    private var scrollContentView = UIView()
    private var nameView = UIView()
    private var profileImageView = UIImageView()

    private var genderDescriptionLabel = UILabel()
    private var genderViewContainer = UIView()
    private var femaleLabel = UILabel()
    private var maleLabel = UILabel()

    private var nameDescriptionLabel = UILabel()
    private var nameViewContainer = UIView()
    private var nameLabel = UILabel()

    private var surnameDescriptionLabel = UILabel()
    private var surnameViewContainer = UIView()
    private var surnameLabel = UILabel()

    private var dateDescriptionLabel = UILabel()
    private var dateViewContainer = UIView()
    private var dateLabel = UILabel()

    private var cityDescriptionLabel = UILabel()
    private var cityViewContainer = UIView()
    private var cityLabel = UILabel()

    private var editButton = UIButton()


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

        setupSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSubviews()

    }
    // MARK: - Actions
    @objc private func didTapButton() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
}

// MARK: - Layout

extension ProfileViewController {
    private func addSubviews() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(scrollContentView)
        scrollContentView.addSubviews(nameView, editButton)
        nameView.addSubviews(profileImageView, nameDescriptionLabel, nameViewContainer, surnameDescriptionLabel, surnameViewContainer, genderDescriptionLabel, genderViewContainer, dateDescriptionLabel, dateViewContainer, cityDescriptionLabel, cityViewContainer)
        genderViewContainer.addSubviews(femaleLabel, maleLabel)
        nameViewContainer.addSubview(nameLabel)
        surnameViewContainer.addSubview(surnameLabel)
        dateViewContainer.addSubview(dateLabel)
        cityViewContainer.addSubview(cityLabel)
    }

    private func setupSubviews() {
        addSubviews()
        title = "Профиль"
        // FIXME: - Добавить англ. язык

        scrollView.contentSize = CGSize(width: 0, height: 1000)

        scrollContentView.backgroundColor = .white

        nameView.backgroundColor = UIColor(hexString: "F8F8F8")
        nameView.layer.cornerRadius = 10

        profileImageView.image = UIImage(named: "Debil")
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 80
        profileImageView.loadImage()

        configureConstraints()

        genderDescriptionLabel.text = "Пол"
        genderDescriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        genderDescriptionLabel.textColor = UIColor(hexString: "878787")
        genderViewContainer.backgroundColor = UIColor(hexString: "ECECEC")
        genderViewContainer.layer.cornerRadius = 10

        femaleLabel.text = UserDefaults.standard.string(forKey: "female")
        femaleLabel.textColor = UIColor(hexString: "000000")
        maleLabel.text = UserDefaults.standard.string(forKey: "male")
        maleLabel.textColor = UIColor(hexString: "000000")

        nameDescriptionLabel.text = "Имя"
        nameDescriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        nameDescriptionLabel.textColor = UIColor(hexString: "878787")

        nameViewContainer.backgroundColor = UIColor(hexString: "ECECEC")
        nameViewContainer.layer.cornerRadius = 10

        nameLabel.text = UserDefaults.standard.string(forKey: "name")
        nameLabel.textColor = UIColor(hexString: "000000")

        surnameDescriptionLabel.text = "Фамилия"
        surnameDescriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        surnameDescriptionLabel.textColor = UIColor(hexString: "878787")

        surnameViewContainer.backgroundColor = UIColor(hexString: "ECECEC")
        surnameViewContainer.layer.cornerRadius = 10

        surnameLabel.text = UserDefaults.standard.string(forKey: "surname")
        surnameLabel.textColor = UIColor(hexString: "000000")

        dateDescriptionLabel.text = "Дата рождения"
        dateDescriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        dateDescriptionLabel.textColor = UIColor(hexString: "878787")

        dateViewContainer.backgroundColor = UIColor(hexString: "ECECEC")
        dateViewContainer.layer.cornerRadius = 10

        dateLabel.text = UserDefaults.standard.string(forKey: "date")
        dateLabel.textColor = UIColor(hexString: "000000")

        cityDescriptionLabel.text = "Город"
        cityDescriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        cityDescriptionLabel.textColor = UIColor(hexString: "878787")


        cityViewContainer.backgroundColor = UIColor(hexString: "ECECEC")
        cityViewContainer.layer.cornerRadius = 10

        cityLabel.text = UserDefaults.standard.string(forKey: "city")
        cityLabel.textColor = UIColor(hexString: "000000")

        editButton.addTarget(self, action: #selector(editButtonDidTap), for: .touchUpInside)
        editButton.backgroundColor = UIColor(hexString: "0090F7")
        editButton.layer.cornerRadius = 10
        editButton.setTitle("Редактировать", for: .normal)
    }

    private func configureConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        scrollContentView.snp.makeConstraints {
            $0.size.equalToSuperview()

        }

        nameView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(32)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(360)
        }

        profileImageView.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(15)
            $0.size.equalTo(160)
        }

        nameDescriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(190)
        }

        nameViewContainer.snp.makeConstraints {
            $0.top.equalTo(nameDescriptionLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().offset(190)
            $0.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }

        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(nameViewContainer)
            $0.centerY.equalTo(nameViewContainer)
        }

        surnameDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameViewContainer.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(190)
        }

        surnameViewContainer.snp.makeConstraints {
            $0.top.equalTo(surnameDescriptionLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().offset(190)
            $0.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(40)
            $0.width.equalTo(160)
        }

        surnameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(surnameViewContainer)
            $0.centerY.equalTo(surnameViewContainer)
        }

        genderDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
        }

        genderViewContainer.snp.makeConstraints {
            $0.top.equalTo(genderDescriptionLabel.snp.bottom).offset(3)
            $0.leading.equalTo(genderDescriptionLabel)
            $0.height.equalTo(40)
            $0.width.equalTo(140)
        }

        femaleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(genderViewContainer)
            $0.centerY.equalTo(genderViewContainer)
        }

        maleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(genderViewContainer)
            $0.centerY.equalTo(genderViewContainer)
        }

        dateDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(genderDescriptionLabel)
            $0.leading.equalTo(dateViewContainer)
        }

        dateViewContainer.snp.makeConstraints {
            $0.top.equalTo(dateDescriptionLabel.snp.bottom).offset(3)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
            $0.width.equalTo(140)
        }

        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(dateViewContainer)
            $0.centerY.equalTo(dateViewContainer)
        }


        cityDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(dateViewContainer.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(15)
        }

        cityViewContainer.snp.makeConstraints {
            $0.top.equalTo(cityDescriptionLabel.snp.bottom).offset(3)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(48)
            $0.width.equalTo(305)
        }

        cityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.size.equalTo(cityViewContainer)
            $0.centerY.equalTo(cityViewContainer)
        }

        editButton.snp.makeConstraints {
            $0.top.equalTo(nameView.snp.bottom).offset(60)
            $0.width.equalTo(335)
            $0.height.equalTo(48)
            $0.leading.trailing.equalToSuperview().inset(20)
        }

    }
}

extension ProfileViewController {
    
    @objc private func changeButtonDidTap() {

    }

    @objc private func saveButtonDidTap() {

    }

    @objc private func changePhotoButtonDidTap() {

    }

    @objc private func editButtonDidTap() {
        print("🟢Кнопка Редактировать")
        let vc = EditingProfileViewController()
        navigationController?.pushViewController(vc, animated: true)

    }

    @objc private func handleDatePicker(_ datePicker: UIDatePicker) {
//        let components = datePicker.date.get(.day, .month, .year)
//        if let day = components.day, let month = components.month, let year = components.year {
//            dateViewContainer.text = "\(day).\(month).\(year)"
//        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profileImageView.image = image
        }

        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
