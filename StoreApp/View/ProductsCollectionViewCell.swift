//
//  SectionCollectionViewCell.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 01.10.2020.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    var catalog = Catalog() 
    var idOfOneProduct: Int?
    
    weak var delegate: AddToFavourite?
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    @IBAction func likeButton(_ sender: UIButton) {
        idOfOneProduct = delegate?.addToFavourite(cell: self)
        catalog.getNotificationCenter()
        NotificationCenter.default.post(name: .likePress ,
                                        object: nil,
                                        userInfo: [ "likedProductId" : self.idOfOneProduct as Any ])
        catalog.endNotificationCenter()
        setLike(self.idOfOneProduct!)
    }

    
    func set(product: Product) {
        self.image.image = UIImage(named: product.image)
        self.productLabel.text =  product.name
        self.productDescriptionLabel.text = product.productDescription
        self.idOfOneProduct = product.id
    }
    
    func setLike(_ id: Int) {
        if catalog.checkingValueOfIslikedProperty(id) {
            likeButton.isSelected = true
        } else { likeButton.isSelected = false }
        
        likeButton.setImage( UIImage(systemName: "heart"), for: .normal)
        likeButton.setImage( UIImage(systemName: "heart.fill"), for: .selected)
        if likeButton.isSelected { likeButton.tintColor = .red }
        else { likeButton.tintColor = .black }
    }
}

protocol AddToFavourite: class  {
    func addToFavourite(cell: Any)  -> Int
}

