//
//  SearchController.swift
//  FlickR Search
//
//  Created by Alex on 2/8/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit

class SearchController {
    
    // MARK: - Search
    
    func request(searchText: String, pageNo: Int, completion: @escaping (Photos?) -> Void){
        guard let request = FlickrRequestConfig.searchRequest(searchText, pageNo).value else {return}

        NetworkController.shared.request(request) { (result) in
            switch result {
            case .Success(let responseData):
                if let model = self.processResponse(responseData) {
                    if let stat = model.stat, stat.uppercased().contains("OK") {
                        return completion(model.photos)
                    } else {
                        return completion(nil)
                    }
                } else {
                    return completion(nil)
                }
            case .Failure(_):
                return completion(nil)
            case .Error(_):
                return completion(nil)
            }
        }
    }
    
    func processResponse(_ data: Data) -> FlickrSearchResults? {
        do {
            let responseModel = try JSONDecoder().decode(FlickrSearchResults.self, from: data)
            return responseModel
        } catch {
            print("Data parsing error: \(error.localizedDescription)")
            return nil
        }
    }
}
