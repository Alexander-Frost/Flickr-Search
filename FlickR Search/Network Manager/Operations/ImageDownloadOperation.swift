//
//  ImageDownloadOperation.swift
//  FlickR Search
//
//  Created by Alex on 2/9/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import Foundation
import UIKit

typealias ImageCompletion = (_ image : UIImage?, _ url : String) -> Void

class ImageDownloadOperation: Operation {
    
    // MARK: - Properties
    
    let url: String?
    var customCompletionBlock: ImageCompletion?
    
    // MARK: - Init
    
    init(url: String, completionBlock: @escaping ImageCompletion) {
        self.url = url
        self.customCompletionBlock = completionBlock
    }
    
    // MARK: - Lifecycle
    
    override func main() {
        if self.isCancelled { return }
        
        if let url = self.url {
            if self.isCancelled { return }
            
            NetworkController.shared.downloadImage(url) { (result) in
                GCD.runOnMainThread {
                    switch result {
                    case .Success(let image):
                        if self.isCancelled { return }
                        if let completion = self.customCompletionBlock{
                            completion(image, url)
                        }
                    default:
                        if self.isCancelled { return }
                        break
                    }
                }
            }
        }
    }
}
