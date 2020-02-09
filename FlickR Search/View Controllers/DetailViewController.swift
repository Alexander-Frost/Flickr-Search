//
//  DetailViewController.swift
//  FlickR Search
//
//  Created by Alex on 2/8/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var receivedPhoto: FlickrPhoto?
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var metaDataTextView: UITextView!
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let photo = receivedPhoto {
            setupViews(photo: photo)
        }
    }

    // MARK: - Setup UI
    
    private func setupViews(photo: FlickrPhoto){
        imageView.downloadImage(photo.imageURL)
        imageView.layer.cornerRadius = 6.0
        imageView.layer.masksToBounds = true
        
        metaDataTextView.text = photo.imageURL + " " + photo.owner + " "
    }

}
