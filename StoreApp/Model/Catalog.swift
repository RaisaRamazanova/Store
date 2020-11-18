//
//  Catalog.swift
//  Store
//
//  Created by Рамазанова Раисат on 15.10.2020.
//

import UIKit

class Catalog {
    
    var categories =
        [Category(id: 1,name: "Холодильники",nestingLevel: 1,image: "photo_1",childCategories: nil,products: nil),
         Category(id: 2,name: "Духовые шкафы",nestingLevel: 1,image: "photo_2",childCategories: nil,products: nil),
         Category(id: 3,name: "Столы",nestingLevel: 1,image: "photo_3",childCategories: nil,products: nil),
         Category(id: 4,name: "Печи",nestingLevel: 1,image: "photo_4",childCategories: nil,products: nil)
         ]

    var products =
        [
                Product(id: 1,
                        name: "Прибор №1",
                        productDescription: "10 500 руб",
                        image: "photo_1",
                        isFavourite: false,
                        isInBasket: false),
                Product(id: 2,
                        name: "Прибор №2",
                        productDescription: "11 000 руб",
                        image: "photo_2",
                        isFavourite: false,
                        isInBasket: false),
                Product(id: 3,
                        name: "Прибор №3",
                        productDescription: "9 000 руб",
                        image: "photo_3",
                        isFavourite: false,
                        isInBasket: false),
                Product(id: 4,
                        name: "Прибор №4",
                        productDescription: "10 000 руб",
                        image: "photo_4",
                        isFavourite: false,
                        isInBasket: false)
            ]

    func getNotificationCenter() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(notificationReceived),
                                               name: .likePress,
                                               object: nil )
    }
    
    func endNotificationCenter() {
        NotificationCenter.default.removeObserver(self,
                                                  name: .likePress,
                                                  object: nil )
    }
    
    @objc func notificationReceived(_ notification: Notification) {
        let likedProductId = notification.userInfo?["likedProductId"] as? Int        
        for product in products {
            if product.id == likedProductId {
                product.isFavourite = !product.isFavourite
                NotificationCenter.default.post(name: .changeLikeButton ,
                                                object: nil,
                                                userInfo: [ "changeLikeButtonId" : product.id as Any])
            }
        }
    }
    
    func checkingValueOfIslikedProperty(_ id: Int) -> Bool {
        for oneProduct in products {
            if oneProduct.id == id {
                if oneProduct.isFavourite { return true }
                else { return false }
            }
        }
        return false
    }
}
