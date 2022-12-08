//
//  LineTabVC.swift
//  Navigation
//
//  Created by Илья Сидорик on 04.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - Properties
    
    var post = Post(title: "Title of this Post")
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 14
        return button
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButton()
        //code
    }
    
 
    // MARK: - Methods
    
    private func setupView() {
        self.view.backgroundColor = .gray
        self.title = "Feed"
//        UINavigationBar.appearance().tintColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
//        UINavigationBar.appearance().backgroundColor = .orange
     
    }
    
    func setupButton() {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 50)
        setupConstraints()
        
    }
    
    @objc
    private func buttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = post.title
        navigationController?.pushViewController(postViewController, animated: true)

    }
    
    func setupConstraints() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    
    
}
