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
    
    let buttonNew: UIButton = {
        let button = UIButton()
        button.setTitle("New button", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        view.addSubview(profileHeaderView)
        view.addSubview(buttonNew)
        setupButtonNew()
        setupConstraints()
    }
    
    
    // MARK: - Methods
    
    private func setupViewController() {
        self.view.backgroundColor = .white
        self.title = "Profile"
    }
    
    private func setupButtonNew() {
        buttonNew.addTarget(self, action: #selector(touchDownButtonNew), for: .touchDown)
        buttonNew.addTarget(self, action: #selector(touchUpInsideButtonNew), for: .touchUpInside)
    }

    // MARK: - Constraint
    
    private func setupConstraints() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
               ])
        
        buttonNew.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonNew.heightAnchor.constraint(equalToConstant: 50),
            buttonNew.leftAnchor.constraint(equalTo: view.leftAnchor),
            buttonNew.rightAnchor.constraint(equalTo: view.rightAnchor),
            buttonNew.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    @objc
    func touchDownButtonNew() {
        buttonNew.alpha = 0.6
    }
    
    @objc
    func touchUpInsideButtonNew() {
        buttonNew.alpha = 1
    }
    
    
}

