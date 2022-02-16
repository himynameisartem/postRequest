//
//  StoreCollectionViewCell.swift
//  PostReqestWithAlamofire
//
//  Created by Артем Кудрявцев on 13.02.2022.
//

import UIKit


class StoreCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet var imageCollectionView: UICollectionView!
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
            self.imageCollectionView.dataSource = self
            self.imageCollectionView.delegate = self
            self.imageCollectionView.register(UINib.init(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        
        
//            let layout = imageCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        print(imageCollectionView.frame.width, imageCollectionView.frame.height)
//        layout.itemSize = CGSize(width: 20, height: imageCollectionView.frame.height)
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
          }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
        
        return cell
    }
}

extension StoreCollectionViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = 1
        let paddingWidth = 40 * (itemPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let availableHeight = collectionView.frame.height
        let widthPerItem = availableWidth / itemPerRow
        let heigtPerItem = availableHeight
        print(widthPerItem, heigtPerItem)
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

