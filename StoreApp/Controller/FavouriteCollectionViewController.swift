//
//  FavouriteCollectionViewController.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 05.10.2020.
//

import UIKit

class FavouriteCollectionViewController: UICollectionViewController {
    
    let catalog = Catalog()
    
    var newCatalog : [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.width / 2)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        self.title = "Избранное"
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeLikeButton),
                                               name: .changeLikeButton,
                                               object: nil )
    }
    
    @objc func changeLikeButton(_ notification: Notification) {
        self.collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoSeque" {
            let oneProduct = segue.destination as! OneProductViewController
            let cell = sender as! FavouriteCollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)!
            let object = newCatalog[indexPath[1]]
            oneProduct.set(product: object)
        }
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return newCatalog.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouriteCell",
                                                      for: indexPath) as! FavouriteCollectionViewCell
        for i in 0...newCatalog.count - 1 {
            let object = newCatalog[i]
            cell.set(product: object)
        }
        return cell
    }
}
