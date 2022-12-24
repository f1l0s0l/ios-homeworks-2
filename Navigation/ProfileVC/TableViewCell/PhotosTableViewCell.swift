//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Илья Сидорик on 21.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right" ), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private lazy var firstPhotoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named:  "logo")
        return imageView
    }()
    
    private lazy var secondPhotoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "logo")


        return imageView
    }()
    
    private lazy var thirdPhotoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "logo")


        return imageView
    }()
    
    private lazy var fourthPhotoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.image = UIImage(named: "logo")


        return imageView
    }()
    

    // MARK: - Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    // MARK: - Methods
    
    private func setupView() {
        self.backgroundColor = .white
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(nextButton)
        self.contentView.addSubview(firstPhotoImage)
        self.contentView.addSubview(secondPhotoImage)
        self.contentView.addSubview(thirdPhotoImage)
        self.contentView.addSubview(fourthPhotoImage)
    }
    
    func setup(withPhoto photos: [String]){
        for (index, photo) in photos.enumerated() {
            switch index {
            case 0:
                self.firstPhotoImage.image = UIImage(named: photo)
            case 1:
                self.secondPhotoImage.image = UIImage(named: photo)
            case 2:
                self.thirdPhotoImage.image = UIImage(named: photo)
            case 3:
                self.fourthPhotoImage.image = UIImage(named: photo)
            default:
                break
            }
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: self.firstPhotoImage.topAnchor, constant: -12),
            
            nextButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            nextButton.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12),
            
            firstPhotoImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12),
            firstPhotoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            firstPhotoImage.rightAnchor.constraint(equalTo: self.secondPhotoImage.leftAnchor, constant: -8),
            firstPhotoImage.widthAnchor.constraint(equalToConstant: (self.contentView.bounds.width - 48) / 4),
            firstPhotoImage.heightAnchor.constraint(equalTo: self.firstPhotoImage.widthAnchor),
            
            secondPhotoImage.rightAnchor.constraint(equalTo: self.thirdPhotoImage.leftAnchor, constant: -8),
            secondPhotoImage.centerYAnchor.constraint(equalTo: self.firstPhotoImage.centerYAnchor),
            secondPhotoImage.widthAnchor.constraint(equalTo: self.firstPhotoImage.widthAnchor),
            secondPhotoImage.heightAnchor.constraint(equalTo: self.secondPhotoImage.widthAnchor),
            
            thirdPhotoImage.rightAnchor.constraint(equalTo: self.fourthPhotoImage.leftAnchor, constant: -8),
            thirdPhotoImage.centerYAnchor.constraint(equalTo: self.firstPhotoImage.centerYAnchor),
            thirdPhotoImage.widthAnchor.constraint(equalTo: self.firstPhotoImage.widthAnchor),
            thirdPhotoImage.heightAnchor.constraint(equalTo: self.thirdPhotoImage.widthAnchor),
            
            fourthPhotoImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -12),
            fourthPhotoImage.centerYAnchor.constraint(equalTo: self.firstPhotoImage.centerYAnchor),
            fourthPhotoImage.widthAnchor.constraint(equalTo: self.firstPhotoImage.widthAnchor),
            fourthPhotoImage.heightAnchor.constraint(equalTo: self.fourthPhotoImage.widthAnchor),
            
        ])
    }
}
