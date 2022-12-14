//
//  InfoViewController.swift
//  Navigation
//
//  Created by Илья Сидорик on 05.12.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    // MARK: - Properties
    
    let alertController = UIAlertController(title: "Title", message: "Massage", preferredStyle: .alert)
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Alert", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 14
        return button
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupUI()
    }
    
    
    // MARK: - Methods
    
    private func setupView() {
        self.view.backgroundColor = .white
    }
    
    func setupUI() {
        setupAlertConfiguration()
        setupButton()
    }
    
    
    
    func setupAlertConfiguration() {
        let action1 = UIAlertAction(title: "OK", style: .default) {_ in
            print("OK")
        }
        let action2 = UIAlertAction(title: "cancel", style: .default) {_ in
            print("cancel")
        }
        alertController.addAction(action1)
        alertController.addAction(action2)
    }
    
    func setupButton() {
        button.addTarget(self, action: #selector(addTarget), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 50)
        view.addSubview(button)
        setupConstraints()
        
    }
    
    @objc func addTarget() {
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    // MARK: - Constraint

    func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
