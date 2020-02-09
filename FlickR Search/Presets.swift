//
//  Presets.swift
//  FlickR Search
//
//  Created by Alex on 2/8/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit

struct Presets {

    static let api_key = "a4f28588b57387edc18282228da39744"
    static let per_page = 60
    static let searchURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(Presets.api_key)&format=json&nojsoncallback=1&safe_search=1&per_page=\(Presets.per_page)&text=%@&page=%ld"
    static let imageURL = "https://farm%d.staticflickr.com/%@/%@_%@_m.jpg"
    static let defaultColumnCount: CGFloat = 3.0
}
