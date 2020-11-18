//
//  OneProductViewController.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 06.10.2020.
//

import UIKit

class OneProductViewController: UIViewController {
    
    var imageProduct: UIImage?
    var Product: String?
    var productDescription: String?
    var idOfOneProduct: Int?
    
    var catalog = Catalog()
    
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var likeButton: UIButton! {
        didSet {
            setLike(self.idOfOneProduct!)
        }
    }
    
    @IBAction func likeButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: .likePress ,
                                        object: nil,
                                        userInfo: [ "likedProductId" : self.idOfOneProduct! as Any ])
        setLike(self.idOfOneProduct!)
    }
    
    
    @IBAction func buyButton (_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = imageProduct
        productLabel.text = Product
        productDescriptionLabel.text = productDescription
        catalog.getNotificationCenter()
    }
    
    func set(product: Product) {
        self.imageProduct = UIImage(named: product.image)
        self.Product =  product.name
        self.productDescription = product.productDescription
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
