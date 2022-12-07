//
//  EditingProfileViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 05.12.2022.
//

import UIKit

final class EditingProfileViewController: UIViewController {

    // MARK: - UI Elements

    private var scrollView = UIScrollView()
    private var scrollContentView = UIView()
    private var changePhotoView = UIView()
    private var profileImageView = UIImageView()
    private var changePhotoButton = UIButton()
    private var aboutMeLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var aboutMeView = UIView()
    private var femaleButton = UIButton()
    private var femaleImageView = UIImageView()
    private var femaleNameLabel = UILabel()
    private var maleButton = UIButton()
    private var maleImageView = UIImageView()
    private var maleNameLabel = UILabel()
    private var nameLabel = UILabel()
    private var nameTextField = UITextField()
    private var surnameLabel = UILabel()
    private var surnameTextField = UITextField()
    private var dateLabel = UILabel()
    private var dateTextField = UITextField()
    private var datePicker = UIDatePicker()
    private var cityLabel = UILabel()
    private var cityTextField = UITextField()


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

extension EditingProfileViewController {
    private func addSubviews() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(scrollContentView)
        scrollContentView.addSubviews(changePhotoView, aboutMeLabel, descriptionLabel, aboutMeView)
        changePhotoView.addSubviews(profileImageView, changePhotoButton)
        aboutMeView.addSubviews(femaleButton, maleButton, nameLabel, nameTextField, surnameLabel, surnameTextField, dateLabel, dateTextField, cityLabel, cityTextField)

        femaleButton.addSubviews(femaleImageView, femaleNameLabel)
        maleButton.addSubviews(maleImageView, maleNameLabel)
    }

    private func setupSubviews() {
        addSubviews()
        // FIXME: - Добавить англ. язык

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveButtonDidTap))

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .done, target: self, action: #selector(changeButtonDidTap))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(hexString: "181818")

        navigationItem.rightBarButtonItem?.tintColor = UIColor(hexString: "181818")


        scrollView.contentSize = CGSize(width: 0, height: 1000)

        scrollContentView.backgroundColor = .white

        changePhotoView.backgroundColor = UIColor(hexString: "F8F8F8")
        changePhotoView.layer.cornerRadius = 10

        profileImageView.image = UIImage(named: "Debil")
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 34
        profileImageView.saveImage()

        // FIXME: - Добавить англ. язык
        changePhotoButton.setTitle("Изменить фото", for: .normal)
        changePhotoButton.setTitleColor(UIColor(hexString: "181818"), for: .normal)
        changePhotoButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        changePhotoButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        // FIXME: - Добавить англ. язык
        aboutMeLabel.text = "Обо мне"
        aboutMeLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        aboutMeLabel.textColor = UIColor(hexString: "181818")
        // FIXME: - Добавить англ. язык
        descriptionLabel.text = "Немного о вас, вашем возрасте и городе проживания"
        descriptionLabel.font = .systemFont(ofSize: 12, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = UIColor(hexString: "8B8B8B")

        aboutMeView.backgroundColor = UIColor(hexString: "F8F8F8")
        aboutMeView.layer.cornerRadius = 10

        femaleButton.backgroundColor = UIColor(hexString: "FFF0F0")
        femaleButton.layer.cornerRadius = 10
        femaleButton.layer.borderWidth = 1
        femaleButton.layer.borderColor = UIColor(hexString: "FE7B7B")?.cgColor
        femaleButton.isSelected = UserDefaults.standard.bool(forKey: "female")
        femaleButton.addTarget(self, action: #selector(femaleButtonDidTap), for: .touchUpInside)


        femaleImageView.image = UIImage(named: "Woman")
        femaleImageView.contentMode = .center

        femaleNameLabel.text = "Женщина"
        femaleNameLabel.font = .systemFont(ofSize: 14, weight: .regular)
        femaleNameLabel.textColor = UIColor(hexString: "FE7B7B")

        maleButton.backgroundColor = UIColor(hexString: "ADF0FF")
        maleButton.layer.cornerRadius = 10
        maleButton.layer.borderWidth = 1
        maleButton.layer.borderColor = UIColor(hexString: "0052FF")?.cgColor
        maleButton.isSelected = UserDefaults.standard.bool(forKey: "male")
        maleButton.addTarget(self, action: #selector(maleButtonDidTap), for: .touchUpInside)


        maleImageView.image = UIImage(named: "Man")
        maleImageView.contentMode = .center

        maleNameLabel.text = "Мужчина"
        maleNameLabel.font = .systemFont(ofSize: 14, weight: .regular)
        maleNameLabel.textColor = UIColor(hexString: "0052FF")

        configureConstraints()

        nameLabel.text = "Имя"
        nameLabel.font = .systemFont(ofSize: 14, weight: .regular)
        nameLabel.textColor = UIColor(hexString: "878787")

        nameTextField.text = UserDefaults.standard.string(forKey: "name")
        nameTextField.textColor = UIColor(hexString: "181818")
        nameTextField.font = .systemFont(ofSize: 16, weight: .regular)
        nameTextField.backgroundColor = UIColor(hexString: "ECECEC")
        nameTextField.layer.cornerRadius = 10
        

        surnameLabel.text = "Фамилия"
        surnameLabel.font = .systemFont(ofSize: 14, weight: .regular)
        surnameLabel.textColor = UIColor(hexString: "878787")

        surnameTextField.text = UserDefaults.standard.string(forKey: "surname")
        surnameTextField.textColor = UIColor(hexString: "181818")
        surnameTextField.font = .systemFont(ofSize: 16, weight: .regular)
        surnameTextField.backgroundColor = UIColor(hexString: "ECECEC")
        surnameTextField.layer.cornerRadius = 10

        dateLabel.text = "Дата рождения"
        dateLabel.font = .systemFont(ofSize: 14, weight: .regular)
        dateLabel.textColor = UIColor(hexString: "878787")

        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.locale = datePicker.calendar.locale
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)

        dateTextField.inputView = datePicker
        dateTextField.text = UserDefaults.standard.string(forKey: "date")
        dateTextField.backgroundColor = UIColor(hexString: "ECECEC")
        dateTextField.layer.cornerRadius = 10
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        dateTextField.leftViewMode = .always
        dateTextField.leftView = spacerView

        cityLabel.text = "Город"
        cityLabel.font = .systemFont(ofSize: 14, weight: .regular)
        cityLabel.textColor = UIColor(hexString: "878787")

        cityTextField.text = UserDefaults.standard.string(forKey: "city")
        cityTextField.textColor = UIColor(hexString: "181818")
        cityTextField.font = .systemFont(ofSize: 16, weight: .regular)
        cityTextField.backgroundColor = UIColor(hexString: "ECECEC")
        cityTextField.layer.cornerRadius = 10
    }

    private func configureConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }

        scrollContentView.snp.makeConstraints {
            $0.size.equalToSuperview()

        }

        changePhotoView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(98)
        }

        profileImageView.snp.makeConstraints {
            $0.top.left.bottom.equalToSuperview().inset(15)
            $0.size.equalTo(68)
        }

        changePhotoButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(38)
            $0.bottom.equalToSuperview().inset(36)
            $0.trailing.equalToSuperview().inset(74)
            $0.width.equalTo(127)
        }

        aboutMeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(changePhotoView.snp.bottom).offset(30)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(aboutMeLabel.snp.bottom).offset(6)
            $0.leading.equalTo(aboutMeLabel)
            $0.width.equalTo(250)
        }

        aboutMeView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(440)
        }

        femaleButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(15)
            $0.height.equalTo(48)
            $0.width.equalTo(145)
        }

        femaleImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().inset(84)
            $0.width.equalTo(37)
            $0.height.equalTo(56)
        }

        femaleNameLabel.snp.makeConstraints {
            $0.leading.equalTo(femaleImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().offset(11)
            $0.trailing.equalToSuperview().inset(4)
        }

        maleButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(48)
            $0.width.equalTo(145)
        }

        maleImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(9)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(48)
            $0.height.equalTo(44)
        }

        maleNameLabel.snp.makeConstraints {
            $0.leading.equalTo(maleImageView.snp.trailing).offset(14)
            $0.top.equalToSuperview().offset(11)
            $0.trailing.equalToSuperview().inset(4)
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(femaleButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(15)
        }

        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(48)
            $0.width.equalTo(305)
        }

        surnameLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(15)
        }

        surnameTextField.snp.makeConstraints {
            $0.top.equalTo(surnameLabel.snp.bottom).offset(3)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(48)
            $0.width.equalTo(305)
        }


        dateLabel.snp.makeConstraints {
            $0.top.equalTo(surnameTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(15)
        }

        dateTextField.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(3)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(48)
            $0.width.equalTo(305)
        }

        cityLabel.snp.makeConstraints {
            $0.top.equalTo(dateTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(15)
        }

        cityTextField.snp.makeConstraints {
            $0.top.equalTo(cityLabel.snp.bottom).offset(3)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(48)
            $0.width.equalTo(305)
        }

    }
}

extension EditingProfileViewController {

    @objc private func changeButtonDidTap() {

    }

    @objc private func saveButtonDidTap() {
        let name = nameTextField.text
        let surname = surnameTextField.text
        let date = dateTextField.text
        let city = cityTextField.text

        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(surname, forKey: "surname")
        UserDefaults.standard.set(date, forKey: "date")
        UserDefaults.standard.set(city, forKey: "city")
        profileImageView.saveImage()
    }

    @objc private func changePhotoButtonDidTap() {

    }

    @objc private func femaleButtonDidTap() {
        let female = "Женщина"
        UserDefaults.standard.removeObject(forKey: "male")
        UserDefaults.standard.set(female, forKey: "female")

        print("femalebutton☢️")
    }

    @objc private func maleButtonDidTap() {
        let male = "Мужчина"
        UserDefaults.standard.removeObject(forKey: "female")
        UserDefaults.standard.set(male, forKey: "male")

        print("malebutton☢️")
    }

    @objc private func handleDatePicker(_ datePicker: UIDatePicker) {
        let components = datePicker.date.get(.day, .month, .year)
        if let day = components.day, let month = components.month, let year = components.year {
            dateTextField.text = "\(day).\(month).\(year)"
        }
    }
}

extension EditingProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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

extension UIImageView {
    func saveImage(){
    guard let image = self.image, let data = image.jpegData (compressionQuality: 0.5) else { return }
      let encoded = try! PropertyListEncoder ().encode (data)
      UserDefaults.standard.set(encoded, forKey: "image")
    }
    func loadImage() {
        guard let data = UserDefaults.standard.data(forKey: "image") else { return }
        let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
        let image = UIImage(data: decoded)
        self.image = image
    }
}
