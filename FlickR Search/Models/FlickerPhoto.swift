//
//  FlickerPhoto.swift
//  FlickR Search
//
//  Created by Alex on 2/8/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import Foundation

struct FlickrPhoto: Codable {
    let farm : Int
    let id : String
    let isfamily : Int
    let isfriend : Int
    let ispublic : Int
    let owner: String
    let secret : String
    let server : String
    let title: String
    
    var imageURL: String {
        // We return the final image url
        let urlString = String(format: "https://farm%d.staticflickr.com/%@/%@_%@_m.jpg", farm, server, id, secret)
        return urlString
    }
}

struct Photos: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let photo: [FlickrPhoto]
    let total: String
}
