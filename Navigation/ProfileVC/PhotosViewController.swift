//
//  Test.swift
//  Navigation
//
//  Created by Илья Сидорик on 21.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    // MARK: - Properties

    private enum Constants {
        static let numberOfColums: CGFloat = 3
        static let minimumInteritemSpacing: CGFloat = 8
        static let minimumLineSpacing: CGFloat = 8
        static let sectionInset: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = Constants.minimumInteritemSpacing
        layout.minimumLineSpacing = Constants.minimumLineSpacing
        layout.sectionInset = Constants.sectionInset
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCellID")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCellID")
        
        return collectionView
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraint()
    }
// Это очень важная штука для "Юзер френдли"
// если добавить self.navigationController?.navigationBar.isHidden = false в viewDidLoad то все работает
// И  если начать свайп назад, пропадает navigation bar
// Но!!! Если не доконца свайпнуть, и вернуть обратно все, то Navigation bar так и не появиться)))
// На сколько я помню, это срабатывает каждый раз при заходе на экран, как раз то, что нам и нужно
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    // MARK: - Methods
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        self.view.addSubview(collectionView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
  
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Photos.photos.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCellID", for: indexPath)
//        cell.backgroundColor = .orange
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCellID", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCellID", for: indexPath)
            cell.backgroundColor = .orange
            return cell
        }
        
        cell.setup(withPhoto: Photos.photos[indexPath.item])
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - (Constants.numberOfColums - 1) * Constants.minimumInteritemSpacing - Constants.sectionInset.left - Constants.sectionInset.right
        let itemWidth = (width / Constants.numberOfColums)
         return CGSize(width: itemWidth, height: itemWidth)
    }
    
}
