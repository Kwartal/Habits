//
//  HabitsViewController.swift
//  Doodze
//
//  Created by Богдан Баринов on 01.11.2022.
//

import UIKit
import CoreData

final class HabitsViewController: UIViewController {

    private var savedHabits = [Habit]()
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

        setupSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        fetchData()
    }

    private func configureTableView() {
        tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: HabitTableViewCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 220
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
    }

}

// MARK: - Layout

extension HabitsViewController {

    private func addSubviews() {
        view.addSubviews(tableView)
    }

    private func setupSubviews() {
        addSubviews()
        configureTableView()
        configureConstraints()
        configureNavigation()
    }

    private func configureConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func configureNavigation() {
        // FIXME: - Локализация
        navigationItem.title = "Добавьте вредную привычку"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(resetAllRecords))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBadHabbit))
    }
}

extension HabitsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedHabits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HabitTableViewCell.reuseId, for: indexPath) as? HabitTableViewCell else { return UITableViewCell() }
        cell.configure(badHabbit: savedHabits[indexPath.row], color: Colors.color(by: indexPath.row))
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            savedHabits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

extension HabitsViewController {

    @objc private func addBadHabbit() {
        let vc = SelectHabitViewController()
        navigationController?.pushViewController(vc, animated: false)
    }

}

extension HabitsViewController {

    func fetchData() {
        savedHabits = []
        context = appDelegate.persistentContainer.viewContext
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "HabitEntity")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                let name = data.value(forKey: "name") as? String ?? ""
                let imageName = data.value(forKey: "imageName") as? String ?? ""
                let descr = data.value(forKey: "descr") as? String ?? ""
                print("User Name is : "+name+" and Age is : "+imageName+" and "+descr)
                let model = Habit(name: name, imageName: imageName, description: descr)
                savedHabits.append(model)
                tableView.reloadData()
            }
        } catch {
            print("Fetching data Failed")
        }
    }

    @objc private func resetAllRecords() {

        let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "HabitEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do
        {
            try context.execute(deleteRequest)
            try context.save()
            tableView.reloadData()
        }
        catch
        {
            print ("There was an error")
        }
    }
}
