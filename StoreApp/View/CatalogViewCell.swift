//
//  CatalogViewCell.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 30.09.2020.
//

import UIKit

class CatalogViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func set(forOne: Category) {
        self.image.image = UIImage(named: forOne.image)
        self.label.text = forOne.name
    }
}
