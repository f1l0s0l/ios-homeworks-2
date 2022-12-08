//
//  InfoTabCV.swift
//  Navigation
//
//  Created by Илья Сидорик on 04.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties
    let profileHeaderView = ProfileHeaderView()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        view.addSubview(profileHeaderView)
    }
    
    
    // MARK: - Methods
    
    private func setupViewController() {
        self.view.backgroundColor = .white
        self.title = "Profile"
    }

    
    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
        // Позицианируем ProfileHeaderView относительно safe area ProfileViewController
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
               ])
    }

    
    
    
    
}

