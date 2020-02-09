//
//  FlickrRequestConfig.swift
//  FlickR Search
//
//  Created by Alex on 2/8/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit

enum FlickrRequestConfig {
    case searchRequest(String, Int)
    
    var value: Request? {
        switch self {
        case .searchRequest(let searchText, let pageNo):
            let urlString = String(format: Presets.searchURL, searchText, pageNo)
            let reqConfig = Request.init(requestMethod: .get, urlString: urlString)
            return reqConfig
        }
    }
}
