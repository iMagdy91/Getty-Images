//
//  GIGettyTableViewCell.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/17/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit
import Kingfisher

typealias ImageDownloadCompletion = () -> Void

class GIGettyTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var imageIDLabel     : UILabel!
    @IBOutlet private weak var gettyImageView   : UIImageView!
    @IBOutlet private weak var imageTitleLabel  : UILabel!

    // MARK: - Cell Customization
    func customizeCellWithModel(gettyImage: GIImageViewModel?, completion: @escaping ImageDownloadCompletion) {
        imageIDLabel.text = gettyImage?.imageID
        imageTitleLabel.text = gettyImage?.imageTitle
        
        if let urlString = gettyImage?.imageURL {
            let url = URL(string: urlString)
            gettyImageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "Placeholder"), options: nil, progressBlock: nil, completionHandler: {[weak self] (image, error, cacheType, url) in
                self?.gettyImageView.sizeToFit()
                if cacheType == .none || cacheType == .disk {
                    completion()
                }
            })
        }
    }
}
