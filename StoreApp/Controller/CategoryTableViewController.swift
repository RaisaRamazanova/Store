//
//  StoreTableViewController.swift
//  StoreApp
//
//  Created by Рамазанова Раисат on 01.10.2020.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    
    let catalog = Catalog()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.title = "Категории"
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalog.categories.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeTableCell",
                                                 for: indexPath) as! CategoryTableViewCell
        
        let oneCategory = catalog.categories[indexPath.row]
        cell.set(_ : oneCategory)
        return cell
    }
    
    // MARK: - Table View delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
