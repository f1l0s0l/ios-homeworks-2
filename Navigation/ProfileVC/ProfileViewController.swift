//
//  InfoTabCV.swift
//  Navigation
//
//  Created by Илья Сидорик on 04.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    private let profileHeaderView = ProfileHeaderView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.tableHeaderView = profileHeaderView
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
        
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupConstraints()
    }
    

    // MARK: - Methods
    
    private func setupViewController() {
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
}


extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Тест \(indexPath)"
        return cell
    }

}


extension ProfileViewController: UITableViewDelegate {
    
////     Отображение кастомного Header у Section
////     Сюда помещаем View с Именем нашего пользователя
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        48
//    }
    
}




















//    // MARK: - Properties
//
//    let profileHeaderView = ProfileHeaderView()
//
//
//    let buttonNew: UIButton = {
//        let button = UIButton()
//        button.setTitle("New button", for: .normal)
//        button.backgroundColor = .systemBlue
//        return button
//    }()
//
//
//    // MARK: - Life cycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViewController()
//        view.addSubview(profileHeaderView)
//        view.addSubview(buttonNew)
//        setupConstraints()
//    }
//
//
//    // MARK: - Methods
//
//    private func setupViewController() {
//        self.view.backgroundColor = .white
//    }
//
//
//    // MARK: - Constraint
//
//    private func setupConstraints() {
//        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
//
//        ])
//    }
