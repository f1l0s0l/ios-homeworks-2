//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Илья Сидорик on 08.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - Properties
    
    private var statusText: String = "Любимая доча"
    
    
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
        buttonShowStatus.addTarget(self, action: #selector(tapOnButtonShowStatus), for: .touchUpInside)
        //Добавил прстую аниманию нажатия на кнопку
        buttonShowStatus.addTarget(self, action: #selector(tapDownButtonShowStatus), for: .touchDown)
        addSubview(changeUserStatus)
        //Добавил изменение текста на кнопке в "Set status" согласно макету
        changeUserStatus.addTarget(self, action: #selector(titleButtonShowStatusChange), for: .touchDown) //!!!!!!!!
        changeUserStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        setupConstraint()
    }
    
    
    // MARK: - UIView items
    
    let userPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "IMG_4570")
        imageView.clipsToBounds = true
        imageView.backgroundColor = .orange
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 55
        return imageView
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.text = "Ария"
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
    
    let changeUserStatus: TextFieldWithPadding = {
        let text = TextFieldWithPadding()
        text.backgroundColor = .white
        text.text = "Любимая доча"
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.layer.cornerRadius = 12
        text.textPadding.left = 7
        return text
    }()
    
    
    
    // MARK: - Constraint
    
    
    private func setupConstraint() {
        
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
            buttonShowStatus.topAnchor.constraint(equalTo: self.userPhoto.bottomAnchor, constant: 31), //было значение 16
            buttonShowStatus.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            buttonShowStatus.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            buttonShowStatus.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        userStatus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userStatus.bottomAnchor.constraint(equalTo: self.buttonShowStatus.topAnchor, constant: -59), // было значение -34
            userStatus.heightAnchor.constraint(equalToConstant: 14),
            userStatus.leftAnchor.constraint(equalTo: self.userName.leftAnchor, constant: 0)
//            userStatus.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        changeUserStatus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            changeUserStatus.topAnchor.constraint(equalTo: self.userStatus.bottomAnchor, constant: 10),
            changeUserStatus.leftAnchor.constraint(equalTo: self.userStatus.leftAnchor, constant: 0),
            changeUserStatus.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            changeUserStatus.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    
    //Тут я добавил простую анимацию нажатия на кнопку
    @objc
    func tapOnButtonShowStatus() {
        buttonShowStatus.alpha = 1
        userStatus.text = statusText
        print(userStatus.text ?? "Нет статуса")
        //Добавил закрытие клавиатуры по нажатию на эту кнопку
        self.endEditing(true)
        buttonShowStatus.setTitle("Show status", for: .normal)
        
    }
    
    @objc
    func tapDownButtonShowStatus() {
        buttonShowStatus.alpha = 0.6
    }
    
    @objc
    func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? statusText
    }
    //Добавил изменение текста на кнопке в "Set status" согласно макету
    @objc
    func titleButtonShowStatusChange(){
        buttonShowStatus.setTitle("Set status", for: .normal)
    }
    
}
