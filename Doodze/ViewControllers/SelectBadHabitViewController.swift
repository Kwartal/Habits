//
//  SelectBadHabitViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 07.11.2022.
//

import UIKit
import SnapKit

final class SelectBadHabitViewController: UIViewController {
    private var situationBadHabbits = Situation.badHabbits

    // MARK: - UI Elements

    private var tableView = UITableView(frame: .zero, style: .grouped)

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
        setupSubviews()
    }

    // MARK: - Actions
    private func configureTableView() {
        tableView.register(NewBadHabitTableViewCell.self, forCellReuseIdentifier: NewBadHabitTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 110
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(hexString: "03C7BE")

    }
}

// MARK: - Layout

extension SelectBadHabitViewController {
    private func addSubviews() {
        view.addSubviews(tableView)
    }

    private func setupSubviews() {
        addSubviews()
        configureTableView()
        configureConstraints()
    }

    private func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension SelectBadHabitViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        situationBadHabbits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewBadHabitTableViewCell.reuseId, for: indexPath) as? NewBadHabitTableViewCell else { return UITableViewCell() }

        cell.configure(badHabbit: situationBadHabbits[indexPath.row], color: Colors.color(by: indexPath.row))

        return cell
    }
}
