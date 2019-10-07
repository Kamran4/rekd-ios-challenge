//
//  ImageCollectionViewCell.swift
//  Rekd
//
//  Created by Thomas Chang on 7/25/17.
//  Copyright © 2017 Shahyan Sajid. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        imageView.af_cancelImageRequest()
        imageView.layer.sublayers = nil
    }

}
