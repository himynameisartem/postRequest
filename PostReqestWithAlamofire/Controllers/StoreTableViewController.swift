//
//  StoreTableViewController.swift
//  PostReqestWithAlamofire
//
//  Created by Артем Кудрявцев on 09.02.2022.
//

import UIKit
import Alamofire

class StoreTableViewController: UITableViewController {
    
//    var productManager = ProductManager()
    var product = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        productManager.delegate = self
//        productManager.fetchData()
        tableView.rowHeight = 80.0
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DispatchQueue.main.async {
            tableView.reloadData()
        }
        return product.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = product[indexPath.row]
//        content.secondaryText = item[indexPath.row].price
        cell.contentConfiguration = content
        tableView.reloadData()

        return cell
    }
    
}

//extension StoreTableViewController: ProductManagerDelegate {
//    func didUpdateProduct(product: ProductModel) {
//
//    }
//
//    func didFailWithError(error: Error) {
//        print(error)
//    }


    
    
//}







