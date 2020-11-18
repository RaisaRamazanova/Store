//
//  FavouriteCollectionViewCell.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 05.10.2020.
//

import UIKit

class FavouriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    func set(product: Product) {
        self.image.image = UIImage(named: product.image)
        self.productLabel.text = product.name
        self.productDescriptionLabel.text = product.productDescription
    }
}
