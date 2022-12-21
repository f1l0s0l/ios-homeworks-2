//
//  InfoTabCV.swift
//  Navigation
//
//  Created by Илья Сидорик on 04.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    private var dataPosts: [PostView] = [
    PostView(author: "ЛучшаяМама23", description: "Бла Бла бла бла бла бла бла бла бла бла бла бла Бла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла блаБла Бла бла бла бла бла бла бла бла бла бла бла", image: "1", likes: 145, views: 570),
    PostView(author: "ЛучшийПапа19", description: "Лучшее фото - смешное фото", image: "2", likes: 269, views: 490),
    PostView(author: "БабушкаНеЛегкогоПоведения", description: "Опять внучу от меня забрали! Так скучаю:(((", image: "3", likes: 83, views: 237),
    PostView(author: "БабушкаНеЛегкогоПоведения2", description: "Наконец поняньчусь с любимой внученькой", image: "4", likes: 175, views: 312),
    ]
        
    
    
    private lazy var tableHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        let backgroundView = UIView(frame: view.bounds)
        backgroundView.backgroundColor = UIColor.systemGray6
        view.backgroundView = backgroundView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = tableHeaderView
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCellID")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCellID")
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderViewID")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCellID")
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
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .systemGray6
        self.view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}


extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return self.dataPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCellID", for: indexPath) as? PhotosTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCellID", for: indexPath)
                return cell
            }
            
            cell.setup(withPhoto: Photos.photos)
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCellID", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCellID", for: indexPath)
                return cell
            }
            
            cell.setup(withPost: self.dataPosts[indexPath.row])
            return cell
        }
        
    }
}


extension ProfileViewController: UITableViewDelegate {


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0 {
            if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderViewID") {
                let backgroundView = UIView(frame: headerView.bounds)
                backgroundView.backgroundColor = UIColor.systemGray6
                headerView.backgroundView = backgroundView
                return headerView
            }
        }
        
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 && indexPath.row == 0 {
            let photosViewController = PhotosViewController()
            photosViewController.title = "Photo Gallery"
            navigationController?.pushViewController(photosViewController, animated: true)
        }
            
    }


    

}
