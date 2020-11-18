//
//  BuyCollectionViewController.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 06.10.2020.
//

import UIKit

class BuyCollectionViewController: UICollectionViewController {

    let catalog = Catalog()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionView.frame.width - 20, height: collectionView.frame.width / 4)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoSeque" {
            let oneProduct = segue.destination as! OneProductViewController
            let cell = sender as! BuyCollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)!
            let buyProduct = catalog.products[indexPath[1]]
            oneProduct.set(product: buyProduct)
        }
    }
    
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        var productsCount = 0
        for i in 0...catalog.products.count - 1 {
            if catalog.products[i].isInBasket {
                productsCount += 1
            }
        }
        return productsCount
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuyCell",
                                                      for: indexPath) as! BuyCollectionViewCell
        for i in 0...catalog.products.count - 1 {
            if catalog.products[i].isInBasket {
                cell.set(product: catalog.products[i])
            }
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView
    {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! BuyCollectionReusableView
            headerView.orderPriceLabel.text = "Заказ на сумму"
            return headerView
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath) as! BuyCollectionReusableView
            footerView.numberOfGoodsLabel.text = "Товаров в заказе"
            footerView.goodsWorthLabel.text = "Товары на сумму"
            footerView.totalLabel.text = "Итого"
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
    }  
}
