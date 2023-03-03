//
//  DogsViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 28.02.2023.
//

import UIKit
import SnapKit


class DogsViewController: UIViewController {
// FIXME: мокдата
    var mockData: [Date] = []
    func createMockData() {
        for _ in 1...5 {
            let randomTimeInterval = TimeInterval(Int.random(in: 0...Int(Date().timeIntervalSince1970)))
            let randomDate = Date(timeIntervalSince1970: randomTimeInterval)
            mockData.append(randomDate)
        }

    }
    var arrayInt: [Int] = [1, 2, 3, 4, 5]
    var arrayString: [String] = ["ds", "dsa"]
    var imageMockData = [UIImage(named: "Coffee") ?? UIImage(), UIImage(named: "Sweets") ?? UIImage(), UIImage(named: "Gamepad") ?? UIImage()]

    // MARK: - UI Elements

    private var titleLabel = UILabel()
    private var myMeetingsLabel = UILabel()
    private var myMeetingsSwitch = UISwitch()
    private var segmentedControl = UISegmentedControl(items: ["Все", "Следующие", "Прошедшие"])
    private let tableView = UITableView(frame: .zero, style: .plain)

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
        createMockData()
        
        setupSubviews()
    }

    // MARK: - Actions

    @objc func toggleMyMeetingSwitch() {

    }
}

// MARK: - Layout

private extension DogsViewController {

    func addSubviews() {
        view.addSubviews(titleLabel, myMeetingsLabel, myMeetingsSwitch, segmentedControl, tableView)
    }

    func setupSubviews() {
        addSubviews()

        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)

        configureTitleLabel()
        configureMyMeetingsLabel()
        configureSegmentedControl()
        configureTableView()

        configureConstraints()
    }

    func configureConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(16)
        }

        myMeetingsLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(titleLabel)
        }

        myMeetingsSwitch.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(myMeetingsLabel)
        }

        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(myMeetingsLabel.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(16)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - Configure UI

extension DogsViewController {

    func configureTitleLabel() {
        titleLabel.text = "Встречи"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
    }

    func configureMyMeetingsLabel() {
        myMeetingsLabel.text = "Мои встречи"
        myMeetingsLabel.textColor = .black
        myMeetingsLabel.font = .systemFont(ofSize: 21, weight: .regular)

        myMeetingsSwitch.addTarget(self, action: #selector(toggleMyMeetingSwitch), for: .valueChanged)
    }

    func configureSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .red
    }

    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(cellType: DogsTableViewCell.self)
        tableView.backgroundColor = .brown.withAlphaComponent(0.1)
    }

    func convertDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let dateString = dateFormatter.string(from: date)
        let test = dateString.prefix(3)

        let dateFormatterDay = DateFormatter()
        dateFormatterDay.dateFormat = "dd"
        dateFormatterDay.locale = Locale(identifier: "ru_RU")
        dateFormatterDay.timeZone = TimeZone(secondsFromGMT: 0)
        let dateStringDay = dateFormatterDay.string(from: date)


        return (test.capitalized + "\n" + dateStringDay)
    }

    
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension DogsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DogsTableViewCell = tableView.dequeueReusableCell()
        cell.configure(with: convertDate(date: mockData[indexPath.row]), and: imageMockData)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}




