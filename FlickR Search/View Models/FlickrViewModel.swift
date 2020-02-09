//
//  FlickrViewModel.swift
//  FlickR Search
//
//  Created by Alex on 2/8/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit

class FlickrViewModel {

    // MARK: - Properties
    
    private(set) var photoArray = [FlickrPhoto]()
    private var searchText = ""
    private var pageNo = 1
    private var totalPageNo = 1
    
    var showAlert: ((String) -> Void)?
    var dataUpdated: (() -> Void)?
    
    // MARK: - Instances
    
    private let searchController = SearchController()
    
    // MARK: - Search
    
    func search(text: String, completion:@escaping () -> Void) {
        searchText = text
        photoArray.removeAll()
        fetchResults(completion: completion)
    }
    
    private func fetchResults(completion:@escaping () -> Void) {
        searchController.request(searchText: searchText, pageNo: pageNo) { (result) in

            GCD.runOnMainThread {
                if let result = result {
                    self.totalPageNo = result.pages
                    self.photoArray.append(contentsOf: result.photo)
                    self.dataUpdated?()
                }
            }
        }
    }
    
    func fetchNextPage(completion:@escaping () -> Void) {
        if pageNo < totalPageNo {
            pageNo += 1
            fetchResults {
                completion()
            }
        } else {
            completion()
        }
    }
}

