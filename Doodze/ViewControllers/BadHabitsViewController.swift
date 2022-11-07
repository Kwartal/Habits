//
//  BadHabitsViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 01.11.2022.
//

import UIKit

final class BadHabitsViewController: UIViewController {
    
    
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
        
        setupSubviews()
    }
    
    private func configureTableView() {
        tableView.register(BadHabitTableViewCell.self, forCellReuseIdentifier: BadHabitTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 220
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white

    }
    
    // MARK: - Actions
    
}

// MARK: - Layout

extension BadHabitsViewController {
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupSubviews() {
        addSubviews()
        configureTableView()
        // FIXME: - Локализация
        navigationItem.title = "Добавьте вредную привычку"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBadHabbit))
        navigationItem.rightBarButtonItem?.width = .leastNonzeroMagnitude
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension BadHabitsViewController: UITableViewDataSource, UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        situationBadHabbits.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BadHabitTableViewCell.reuseId, for: indexPath) as? BadHabitTableViewCell else { return UITableViewCell() }

        cell.configure(badHabbit: situationBadHabbits[indexPath.row], color: Colors.color(by: indexPath.row))
        
        return UITableViewCell()
        
    }

}

extension BadHabitsViewController {
    
    @objc private func addBadHabbit() {
        
        let vc = SelectBadHabitViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
}
