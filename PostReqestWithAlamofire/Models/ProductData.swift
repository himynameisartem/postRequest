//
//  Items.swift
//  PostReqestWithAlamofire
//
//  Created by Артем Кудрявцев on 09.02.2022.
//

import Foundation

struct Product: Codable {
    var id: Int
    var name: String
    var price: String
    var description: String
    var images: [Images]
    var attributes: [Attributes]
}

struct Images: Codable {
    var id: Int
    var src: String
    var name: String
}

struct Attributes: Codable {
    var id: Int
    var name: String
    var options: [String]
}

