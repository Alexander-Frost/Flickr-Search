//
//  ImageCollectionViewCell.swift
//  FlickR Search
//
//  Created by Alex on 2/8/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    static let nibName = "ImageCollectionViewCell"

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        imageView.image = nil
    }
    
    // MARK: - Properties
    
    var imageUrl: String? {
        didSet {
            if let imgUrl = imageUrl {
                imageView.image = UIImage(named: "placeholder")
                imageView.downloadImage(imgUrl)
            }
        }
    }
}

