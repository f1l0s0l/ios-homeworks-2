//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Илья Сидорик on 08.12.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    
   private var statusText = StatusText(text: "Любимая доча")

    
    lazy var userPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "1")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .orange
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 55
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private var userPhotoTopConstraint: NSLayoutConstraint?
    private var userPhotoLeftConstraint: NSLayoutConstraint?
    private var userPhotoWidthConstraint: NSLayoutConstraint?
    private var userPhotoHeightConstraint: NSLayoutConstraint?
    private var buttonShowStatusTopConstraint: NSLayoutConstraint?
    private var userPhotoCenterYConstraint: NSLayoutConstraint?
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ария"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
        
    private lazy var buttonShowStatus: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 14
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    private lazy var userStatus: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Любимая доча"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var changeUserStatus: TextFieldWithPadding = {
        let text = TextFieldWithPadding()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.placeholder = "Любимая доча"
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.layer.cornerRadius = 12
        text.textPadding.left = 7
        return text
    }()
    
 
    // MARK: - Life cycle
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViewItems()
        self.setupGestures()

    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
////        self.backgroundColor = .lightGray
//        setupViewItems()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    
    private func setupViewItems() {
//        self.addSubview(userPhoto)
        self.addSubview(userName)
        self.addSubview(buttonShowStatus)
        self.addSubview(userStatus)
        self.addSubview(changeUserStatus)
        self.addSubview(userPhoto)
        self.buttonShowStatus.addTarget(self, action: #selector(tapOnButtonShowStatus), for: .touchUpInside)
        //Добавил прстую аниманию нажатия на кнопку
        self.buttonShowStatus.addTarget(self, action: #selector(tapDownButtonShowStatus), for: .touchDown)
        //Добавил изменение текста на кнопке в "Set status" согласно макету
        self.changeUserStatus.addTarget(self, action: #selector(titleButtonShowStatusChange), for: .touchDown) //!!!!!!!!
        self.changeUserStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        self.setupConstraint()
    }
    
    
    
    
    
    func setupGestures() {

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.userPhoto.addGestureRecognizer(tapGestureRecognizer)
    }

    
    private let profileVC = ProfileViewController()
    
    
    @objc
    private func handleTapGesture() {
        print("Нажатие")
        
        profileVC.setupBackViewAlpha()

        self.animateUserPhoto()
    }


    private func animateUserPhoto() {

        self.userPhotoLeftConstraint?.isActive = false
        self.userPhotoTopConstraint?.isActive = false
        self.buttonShowStatusTopConstraint?.isActive = false

        self.userPhotoWidthConstraint?.constant = self.bounds.width
        self.userPhotoHeightConstraint?.constant = self.bounds.width
//        self.userPhotoCenterYConstraint?  (equalTo: ProfileViewController().backView.centerYAnchor)

        UIView.animate(withDuration: 3, delay: 0, options: .curveEaseInOut) {
            self.layoutIfNeeded()
        }
    }

    
    
    
    //Тут я добавил простую анимацию нажатия на кнопку
    @objc
    func tapOnButtonShowStatus() {
        buttonShowStatus.alpha = 1
        userStatus.text = statusText.text
        changeUserStatus.placeholder = statusText.text
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
        statusText.text = textField.text ?? statusText.text
    }
    //Добавил изменение текста на кнопке в "Set status" согласно макету
    @objc
    func titleButtonShowStatusChange(){
        buttonShowStatus.setTitle("Set status", for: .normal)
    }
    
    
    // MARK: - Constraint
    
    private func setupConstraint() {
        
        self.userPhotoTopConstraint = self.userPhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        self.userPhotoLeftConstraint = self.userPhoto.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)
        self.userPhotoWidthConstraint = self.userPhoto.widthAnchor.constraint(equalToConstant: 110)
        self.userPhotoHeightConstraint = self.userPhoto.heightAnchor.constraint(equalToConstant: 110)
        
//        self.userPhotoCenterYConstraint = self.userPhoto.centerYAnchor.constraint(equalTo: ProfileViewController().view.centerYAnchor)
        
        self.buttonShowStatusTopConstraint = buttonShowStatus.topAnchor.constraint(equalTo: self.userPhoto.bottomAnchor, constant: 31)
        
        NSLayoutConstraint.activate([
//            userPhoto.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
//            userPhoto.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
//            userPhoto.widthAnchor.constraint(equalToConstant: 110),
//            userPhoto.heightAnchor.constraint(equalToConstant: 110),
            userPhotoTopConstraint,
            userPhotoLeftConstraint,
            userPhotoWidthConstraint,
            userPhotoHeightConstraint,
            
            userName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            userName.heightAnchor.constraint(equalToConstant: 18),
            userName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            buttonShowStatusTopConstraint,
//            buttonShowStatus.topAnchor.constraint(equalTo: self.userPhoto.bottomAnchor, constant: 31), //было значение 16
            buttonShowStatus.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            buttonShowStatus.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            buttonShowStatus.heightAnchor.constraint(equalToConstant: 50),
            buttonShowStatus.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            userStatus.bottomAnchor.constraint(equalTo: self.buttonShowStatus.topAnchor, constant: -59), // было значение -34
            userStatus.heightAnchor.constraint(equalToConstant: 14),
            userStatus.leftAnchor.constraint(equalTo: self.userName.leftAnchor, constant: 0),
            
            changeUserStatus.topAnchor.constraint(equalTo: self.userStatus.bottomAnchor, constant: 10),
            changeUserStatus.leftAnchor.constraint(equalTo: self.userStatus.leftAnchor, constant: 0),
            changeUserStatus.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            changeUserStatus.heightAnchor.constraint(equalToConstant: 40),
        ].compactMap({ $0 }))
    }
    
}
