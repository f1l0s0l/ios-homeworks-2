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
        textField.backgroundColor = .systemGray6
        
        textField.keyboardType = .emailAddress
        textField.placeholder = "Email or phone"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular) // В макете указано normal Что это????
//        textField.tintColor = accentColor  В макете указано, tintColor: accentColor, Что это значит и как выбрать это значение
        textField.clearButtonMode = .whileEditing
        textField.autocapitalizationType = .none
        textField.textPadding.left = 8
        textField.delegate = self
        textField.tag = 0
        return textField
    }()
    
    private lazy var userPasswordTextField: TextFieldWithPadding = {
        let textField = TextFieldWithPadding()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        
        textField.returnKeyType = .done
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        //        textField.tintColor = accentColor  В макете указано, tintColor: accentColor, Что это значит и как выбрать это значение
        textField.autocapitalizationType = .none
        textField.textPadding.left = 8
        textField.delegate = self
        textField.tag = 1
        return textField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setTitle("Log in", for: .normal)
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixelALPHA08"), for: .selected)//По поводу этого был первый вопрос, который я отправил с работой
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
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didHideKeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//    Что это такое? В коде с лекции это было, но нам не объясняли что это как работает
    
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
        setupTapOnLogInButton()
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {

            let keyboardHeight = keyboardFrame.cgRectValue.height
            
            let logInButtonBottomPointY = self.logInButton.frame.origin.y + self.logInButton.frame.height
            let keyboardOriginY = self.scrollView.frame.height - keyboardHeight //!!!!!!
//             В лекции говорилось считать originY клавиатуры так: От frame.height самой View, но так у меня выдает ошибку, он выдет что originY клавиатуры меньше чем originBottomY кнопки, (то есть клавиатура находиться нише чем кнопка, но это не так!!
//             Если я считаю frame.height от scrollView то все получается
//             Почему так происходит??
            
            let yOffset = keyboardOriginY < logInButtonBottomPointY ? logInButtonBottomPointY - keyboardOriginY + 20 : 0
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
            
            print("🍋 \(keyboardOriginY), \(logInButtonBottomPointY)") //Это для проверки того, что написанно выше
        }
    }
    
    private func setupTapOnLogInButton() {
        self.logInButton.addTarget(self, action: #selector(touchUpInsideOnLogInButton), for: .touchUpInside)
    }

    @objc
    private func touchUpInsideOnLogInButton() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    

    // MARK: - Constraint

    private func setupConstraint() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            logoImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
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
        self.scrollView.setContentOffset(.zero, animated: true)
    }
    
    @objc
    private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
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







// Это относиться к первому вопросу!)

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
