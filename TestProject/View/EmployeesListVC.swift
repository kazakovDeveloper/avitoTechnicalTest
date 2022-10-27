//
//  EmployeesListVC.swift
//  TestProject
//
//  Created by Kazakov Danil on 26.10.2022.
//

import UIKit

final class EmployeesListVC: UIViewController {
    
    private var tableView = UITableView()
    private var employees: [Employee] = []
    private let presenter = EmployeePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Avito"
        tableView.backgroundColor = .white
        presenter.setViewDelegate(delegate: self)
        presenter.getModelData()
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkNetworkConnection()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        setTableViewDelegates()
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        tableView.rowHeight = 100
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: EmployeeCell.identifer)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension EmployeesListVC: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.identifer, for: indexPath) as! EmployeeCell
        let content = cell.defaultContentConfiguration()
        cell.set(employee: employees[indexPath.row])
        
        
        cell.contentConfiguration = content
        return cell
    }
    
}

extension EmployeesListVC: EmployeePresenterDelegate {
    func presentEmployees(employees: [Employee]) {
        self.employees = employees
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


