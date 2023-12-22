//
//  HomeCollectionViewController.swift
//  NavigationFlow
//
//  Created by Javier Cueto on 21/12/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController {
  
    
    
    var viewData: [HomePost] = []
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

    func configUI() {
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPost))
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return viewData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        
        let data = viewData[indexPath.row]
        cell.backgroundColor = .systemGroupedBackground
        cell.titleLabel.text = data.title
        
        cell.descriptionLabel.text = data.description
        return cell
    }
    
    @objc
    func addPost() {
        let controller = PostAddViewController()
        controller.delegate = self
        present(controller, animated: true)
        
    }
}

extension HomeCollectionViewController: PostAddViewControllerDelegate {
    func didSaveData(homePost: HomePost) {
        viewData.append(homePost)
        collectionView.reloadData()
    }
}
