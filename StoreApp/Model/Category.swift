//
//  Category.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 09.10.2020.
//

import UIKit

struct Category {
    let id: Int
    let name: String
    let nestingLevel: Int
    let image: String
    let childCategories: [Int]?
    let products: [Product]?
}
