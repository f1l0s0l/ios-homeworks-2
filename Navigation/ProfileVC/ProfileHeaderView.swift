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
        setupConstraint()
    }
    
    
    // MARK: - UIView items
    
    let userPhoto: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    // let ...UIView items
    
    // MARK: - Constraint
    
    func setupConstraint() {
        
        userPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                   userPhoto.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
                   userPhoto.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
                   userPhoto.widthAnchor.constraint(equalToConstant: 200),
                   userPhoto.heightAnchor.constraint(equalToConstant: 200)
               ])
        
        // UIView items
        //Code
        // UIView items
        //Code
    }
    
    
    

    
    


    
    
}
