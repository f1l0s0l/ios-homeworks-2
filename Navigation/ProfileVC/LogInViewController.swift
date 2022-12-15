//
//  LogInViewController.swift
//  Navigation
//
//  Created by Илья Сидорик on 14.12.2022.
//

import UIKit

class LogInViewController: UIViewController {

    // MARK: - Properties
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        return stackView
    }()
    
    private lazy var userEmailTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.placeholder = "Logginzdfsdfsdgfzxczxczxcxzczczxczxczxc"
        textField.keyboardType = .emailAddress
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .systemBlue
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = .orange
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.textPadding.left = 8
        textField.tag = 0
        return textField
    }()
    
    private lazy var userPasswordTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = "Password"
        textField.returnKeyType = .done
        textField.isSecureTextEntry = true
        textField.backgroundColor = .systemBlue
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = .orange
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.textPadding.left = 8
        textField.tag = 1
        return textField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixelALPHA08"), for: .selected)
        button.setBackgroundImage(UIImage(named: "blue_pixelALPHA08"), for: .highlighted)
        button.setBackgroundImage(UIImage(named: "blue_pixelALPHA08"), for: .disabled)
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    
    // MARK: - Methods

    private func setupViewController() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.scrollView)
        setupScrollView()
        setupGestures()
        setupConstraint()
    }
    
    private func setupScrollView() {
        self.scrollView.addSubview(self.logoImage)
        self.scrollView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.userEmailTextField)
        self.stackView.addArrangedSubview(self.userPasswordTextField)
        self.scrollView.addSubview(self.logInButton)
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    

    // MARK: - Constraint

    private func setupConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            logoImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor, constant: 120),
            stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            logInButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16),
            logInButton.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            logInButton.centerXAnchor.constraint(equalTo: self.stackView.centerXAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    

    @objc
    private func forcedHidingKeyboard() {
        self.view.endEditing(true)
    }
    
}


extension LogInViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            self.userPasswordTextField.becomeFirstResponder()
        } else {
            self.forcedHidingKeyboard()
        }
        return true
    }
}










//private let logInButton: UIButton = {
//    var configuration = UIButton.Configuration.filled()
//    configuration.background.cornerRadius = 100
////        configuration.background.image = UIImage(named: "IMG_4570")
////        configuration.title = "Log in"
////        configuration.baseForegroundColor = .white
//    configuration.automaticallyUpdateForSelection = true
//
//    let handler: UIButton.ConfigurationUpdateHandler = { button in
//        switch button.state {
//        case .highlighted:
//            button.alpha = 1
//        case .normal:
//            button.alpha = 1
//        default:
//            break
//        }
//
//    }
//
//    let button = UIButton(configuration: configuration, primaryAction: nil)
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.configurationUpdateHandler = handler
//    button.setTitleColor(UIColor.white, for: .normal)
//    button.setTitle("Log in", for: .normal)
////        button.alpha = 0.3
////        button.clipsToBounds = true
//    return button
//}()
