//
//  CategoryTableViewCell.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 01.10.2020.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(_ oneCategory: Category) {
        self.label.text = oneCategory.name
    }
}
