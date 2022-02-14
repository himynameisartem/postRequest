//
//  ProductManager.swift
//  PostReqestWithAlamofire
//
//  Created by Артем Кудрявцев on 09.02.2022.
//

//import UIKit
//import Alamofire
//
//protocol ProductManagerDelegate {
//    func didUpdateProduct(product: ProductModel)
//    func didFailWithError(error: Error)
//}
//
//
//struct ProductManager {
//    
//    var delegate: ProductManagerDelegate?
//    
//    let url = "https://naspote.fun/wp-json/wc/v3/products?consumer_key=ck_b055e3545ed7a54000ecfbe25d2e403105c5de95&consumer_secret=cs_7fbb4bb2303cac5d9abbf0b4b1fe471e557ab8f8"
//    
//    func fetchData() {
//        let decoder: JSONDecoder = {
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            return decoder
//        }()
//        
//        AF.request(url)
//            .validate(statusCode: 200..<300)
//            .responseDecodable(of: [Product].self, decoder: decoder) { responce in
//                switch responce.result {
//                case .success(let items):
//                    var name = [String]()
//                    var discription = [String]()
//                    var images = [UIImage]()
//                    var size = [[String]]()
//                    for i in items {
//                        name.append(i.name)
//                        discription.append(i.description)
//                        for i in i.images {
//                            if let imgUrl = URL(string: i.src) {
//                                if let imgData = try? Data(contentsOf: imgUrl){
//                                    let img = UIImage(data: imgData)
//                                    images.append(img!)
//                                }
//                            }
//                        }
//                        for i in i.attributes {
//                            size.append(i.options)
//                        }
//                    }
//                    let product = ProductModel(name: name, discription: discription, image: images, size: size)
//                    self.delegate?.didUpdateProduct(product: product)
//                    print(product)
//                case .failure(let error):
//                    print("error", error.localizedDescription)
//                    self.delegate?.didFailWithError(error: error)
//                }
//            }
//    }
//    
//}
