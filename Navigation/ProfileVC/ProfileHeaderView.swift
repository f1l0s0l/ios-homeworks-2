//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Илья Сидорик on 08.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
   
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .lightGray
        setupViewItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    
    private func setupViewItems() {
        addSubview(userPhoto)
        addSubview(userName)
        addSubview(buttonShowStatus)
        addSubview(userStatus)
        setupConstraint()
    }
    
    
    // MARK: - UIView items
    
    let userPhoto: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 55
        return view
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.text = "Ария Ильинична"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
        
    let buttonShowStatus: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 14 //По заданию, должно быть 4! Но это не похоже на макет!!!
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    let userStatus: UILabel = {
        let label = UILabel()
        label.text = "Любимая доча"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    
    // MARK: - Constraint
    
    
    func setupConstraint() {
        
        userPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userPhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            userPhoto.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            userPhoto.widthAnchor.constraint(equalToConstant: 110),
            userPhoto.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            userName.heightAnchor.constraint(equalToConstant: 18),
            //Выравнивание по середине по координате X
            userName.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        buttonShowStatus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonShowStatus.topAnchor.constraint(equalTo: self.userPhoto.bottomAnchor, constant: 16),
            buttonShowStatus.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            buttonShowStatus.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            buttonShowStatus.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        userStatus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userStatus.bottomAnchor.constraint(equalTo: self.buttonShowStatus.topAnchor, constant: -34),
            userStatus.heightAnchor.constraint(equalToConstant: 14),
            userStatus.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        // UIView items
        //Code
        // UIView items
        //Code
    }
    
    
    

    
    


    
    
}
