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
        
        addSubview(buttomShowStatus)
        setupConstraint()
    }
    
    
    // MARK: - UIView items
    
    let userPhoto: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 75
        return view
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.text = "Доча"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    
    
    
    
    let buttomShowStatus: UIButton = {
        let buttom = UIButton()
        buttom.setTitle("Show status", for: .normal)
        buttom.layer.cornerRadius = 14 //По заданию, должно быть 4! Но это не похоже на макет!!!
        buttom.backgroundColor = .systemBlue
        return buttom
    }()
    
    
    
    // MARK: - Constraint
    
    func setupConstraint() {
        
        userPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userPhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            userPhoto.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            userPhoto.widthAnchor.constraint(equalToConstant: 150),
            userPhoto.heightAnchor.constraint(equalToConstant: 150)
               ])
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            userName.heightAnchor.constraint(equalToConstant: 18),
            //Выравнивание по середине по координате X
            userName.centerXAnchor.constraint(equalTo: self.centerXAnchor)
               ])
        
        buttomShowStatus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttomShowStatus.topAnchor.constraint(equalTo: self.userPhoto.bottomAnchor, constant: 16),
            buttomShowStatus.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            buttomShowStatus.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            buttomShowStatus.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // UIView items
        //Code
        // UIView items
        //Code
    }
    
    
    

    
    


    
    
}
