//
//  TimersViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 01.11.2022.
//

import UIKit

final class TimersViewController: UIViewController {
    
    
    private var situationTimers = Situation.timers
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
        tableView.register(TimerTableViewCell.self, forCellReuseIdentifier: TimerTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 220
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white

    }
    
    // MARK: - Actions
    
}

// MARK: - Layout

extension TimersViewController {
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupSubviews() {
        addSubviews()
        configureTableView()
        title = "Выберите таймер"
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

extension TimersViewController: UITableViewDataSource, UITableViewDelegate {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        situationTimers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TimerTableViewCell.reuseId, for: indexPath) as? TimerTableViewCell else { return UITableViewCell() }
        
        cell.configure(timer: situationTimers[indexPath.row], color: Colors.color(by: indexPath.row))
        
        return cell
    }
    
    
    
    
    
}
