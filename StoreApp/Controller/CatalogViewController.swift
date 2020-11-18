//
//  StoreCollectionViewController.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 30.09.2020.
//

import UIKit

class CatalogViewController: UICollectionViewController {

    let catalog = Catalog()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.width / 3)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return catalog.categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCell",
                                                      for: indexPath) as! CatalogViewCell
        let category = catalog.categories[indexPath.row]
        cell.set(forOne: category)
        return cell
    }
}
