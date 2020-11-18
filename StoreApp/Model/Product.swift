//
//  File.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 09.10.2020.
//

import UIKit

class Product {
    let id: Int
    var name: String
    let productDescription: String
    let image: String
    var isFavourite: Bool
    var isInBasket: Bool

    init(id: Int, name: String, productDescription: String, image: String,  isFavourite: Bool, isInBasket: Bool) {
        self.id = id
        self.name = name
        self.productDescription = productDescription
        self.image = image
        self.isFavourite = isFavourite
        self.isInBasket = isInBasket
    }
}
