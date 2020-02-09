//
//  Cache.swift
//  FlickR Search
//
//  Created by Alex on 2/9/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import Foundation
import UIKit

class Cache {

    // MARK: - Properties
    
    static let shared = Cache()
    private(set) var cache: NSCache<AnyObject, AnyObject> = NSCache()
    
    // MARK: - Cache
    
    func getImageFromCache(key: String) -> UIImage? {
        if (self.cache.object(forKey: key as AnyObject) != nil) {
            return self.cache.object(forKey: key as AnyObject) as? UIImage
        } else {
            return nil
        }
    }
    
    func saveImageToCache(key: String, image: UIImage) {
        self.cache.setObject(image, forKey: key as AnyObject)
    }
}
