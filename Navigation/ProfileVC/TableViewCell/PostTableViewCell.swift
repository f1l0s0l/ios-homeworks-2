//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Илья Сидорик on 19.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    private lazy var titleTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var footerTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var likesCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var viewsCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    
    // MARK: - Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupTableViewCell()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods

    private func setupTableViewCell(){
        self.contentView.addSubview(self.titleView)
        self.contentView.addSubview(self.postImageView)
        self.contentView.addSubview(self.footerView)

        titleView.addSubview(titleTextLabel)
        footerView.addSubview(footerTextLabel)
        footerView.addSubview(likesCountLabel)
        footerView.addSubview(viewsCountLabel)
    }
    
    func setup(withPost post: PostView) {
        self.titleTextLabel.text = post.author
        self.postImageView.image = UIImage(named: post.image)
        self.footerTextLabel.text = post.description
        self.likesCountLabel.text = "Likes: \(post.likes)"
        self.viewsCountLabel.text = "Views: \(post.views)"
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            titleView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            titleView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            
            titleTextLabel.topAnchor.constraint(equalTo: self.titleView.topAnchor, constant: 16),
            titleTextLabel.leftAnchor.constraint(equalTo: self.titleView.leftAnchor, constant: 10),
            titleTextLabel.rightAnchor.constraint(equalTo: self.titleView.rightAnchor, constant: -10),
            titleTextLabel.bottomAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: -12),
            
            postImageView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor),
            postImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            postImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: self.contentView.bounds.width),
            
            footerView.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor),
            footerView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            footerView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            footerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            footerTextLabel.topAnchor.constraint(equalTo: self.footerView.topAnchor, constant: 16),
            footerTextLabel.leftAnchor.constraint(equalTo: self.footerView.leftAnchor, constant: 16),
            footerTextLabel.rightAnchor.constraint(equalTo: self.footerView.rightAnchor, constant: -16),

            likesCountLabel.topAnchor.constraint(equalTo: self.footerTextLabel.bottomAnchor, constant: 16),
            likesCountLabel.leftAnchor.constraint(equalTo: self.footerView.leftAnchor, constant: 16),
            likesCountLabel.bottomAnchor.constraint(equalTo: self.footerView.bottomAnchor, constant: -16),
            
            viewsCountLabel.rightAnchor.constraint(equalTo: self.footerView.rightAnchor, constant: -16),
            viewsCountLabel.centerYAnchor.constraint(equalTo: self.likesCountLabel.centerYAnchor),
            viewsCountLabel.bottomAnchor.constraint(equalTo: self.footerView.bottomAnchor, constant: -16)

        ])
    }
    
    
    
}
