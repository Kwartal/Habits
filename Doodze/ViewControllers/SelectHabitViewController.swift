//
//  SelectHabitViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 07.11.2022.
//

import UIKit
import SnapKit
import CoreData

final class SelectHabitViewController: UIViewController {
    
    private var situationBadHabbits = Mock.habbits
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var context: NSManagedObjectContext!
    
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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonPressed))
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Actions
    
    private func configureTableView() {
        tableView.register(NewBadHabitTableViewCell.self, forCellReuseIdentifier: NewBadHabitTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 110
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    
}

// MARK: - Layout

extension SelectHabitViewController {
    
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
    
    @objc private func backButtonPressed() {
        navigationController?.popViewController(animated: false)
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension SelectHabitViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        situationBadHabbits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewBadHabitTableViewCell.reuseId, for: indexPath) as? NewBadHabitTableViewCell else { return UITableViewCell() }
        cell.configure(badHabbit: situationBadHabbits[indexPath.row], color: Colors.color(by: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let habit = situationBadHabbits[indexPath.row]
        context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "HabitEntity", in: context)
        let newHabit = NSManagedObject(entity: entity!, insertInto: context)
        saveData(UserDBObj: newHabit, habit: habit)
//        navigationController?.popViewController(animated: false)
        let vc = UINavigationController(rootViewController: SetupHabitViewController())
        present(vc, animated: false)
    }
}

extension SelectHabitViewController {
    
    func saveData(UserDBObj: NSManagedObject, habit: Habit) {
        UserDBObj.setValue(habit.name, forKey: "name")
        UserDBObj.setValue(habit.imageName, forKey: "imageName")
        UserDBObj.setValue(habit.description, forKey: "descr")
        
        print("Storing Data..")
        do {
            try context.save()
        } catch {
            print("Storing data Failed")
        }
    }
    
}
