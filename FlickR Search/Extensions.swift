//
//  Extensions.swift
//  FlickR Search
//
//  Created by Alex on 2/9/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register(nib nibName: String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
}

extension UIImageView {
    
    func downloadImage(_ url: String) {
        ImageDownloadManager.shared.addOperation(url: url,imageView: self) {  [weak self](result,downloadedImageURL)  in
            GCD.runOnMainThread {
                switch result {
                case .Success(let image):
                    self?.image = image
                case .Failure(_):
                    break
                case .Error(_):
                    break
                }
            }
        }
    }
}
