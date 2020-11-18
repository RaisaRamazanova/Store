//
//  ProductsCollectionViewController.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 01.10.2020.
//

import UIKit

class ProductsCollectionViewController: UICollectionViewController {

    let catalog = Catalog()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.width / 2)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeLikeButton),
                                               name: .changeLikeButton,
                                               object: nil )
    }
    
    @objc func changeLikeButton(_ notification: Notification) {
//        self.collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoSeque" {
            let oneProduct = segue.destination as! OneProductViewController
            let cell = sender as! ProductsCollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)!
            let product = catalog.products[indexPath[1]]
            oneProduct.set(product: product)
        }
    }
    
    
    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return catalog.products.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell",
                                                      for: indexPath) as! ProductsCollectionViewCell
        let object = catalog.products[indexPath.row]
        cell.set(product: object)
        cell.setLike(object.id)
        cell.delegate = self
        return cell
    }
}


// MARK: - AddToFavourite
extension ProductsCollectionViewController: AddToFavourite {

    func addToFavourite(cell: Any) -> Int {
        let indexPath = collectionView.indexPath(for: cell as! UICollectionViewCell)!
        let oneProduct = catalog.products[indexPath[1]]
        return oneProduct.id
    }
}
