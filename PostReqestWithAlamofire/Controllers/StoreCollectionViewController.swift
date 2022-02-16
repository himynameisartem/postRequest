//
//  StoreCollectionViewController.swift
//  PostReqestWithAlamofire
//
//  Created by Артем Кудрявцев on 09.02.2022.
//

import UIKit
import Alamofire

private let reuseIdentifier = "StoreCell"

class StoreCollectionViewController: UICollectionViewController {

    var item = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
        collectionView.register(UINib.init(nibName: "StoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! StoreCollectionViewCell
        
//        cell.nameLabel.text = "sdfsdf"
        return cell
    }

    // MARK: UICollectionViewDelegate


}

extension StoreCollectionViewController {
    
    
    func fetchData() {
        let decoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        
        AF.request("https://naspote.fun/wp-json/wc/v3/products?consumer_key=ck_b055e3545ed7a54000ecfbe25d2e403105c5de95&consumer_secret=cs_7fbb4bb2303cac5d9abbf0b4b1fe471e557ab8f8")
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [Product].self, decoder: decoder) { responce in
                switch responce.result {
                case .success(let items):
                    self.item = items
                case .failure(let error):
                    print("error", error.localizedDescription)
                }
                self.collectionView.reloadData()
            }
    }
    
}

extension StoreCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = 1
        let paddingWidth = 15 * (itemPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemPerRow
        let heigtPerItem = widthPerItem + widthPerItem / 2
        return CGSize(width: widthPerItem, height: heigtPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

