//
//  Image.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit

// View Model Class to be used on UI
class GIImageViewModel: GIBaseViewModel {

    
    // MARK: - Properties
    private(set) var imageID        : String?
    private(set) var imageTitle     : String?
    private(set) var imageCaption   : String?
    private(set) var imageURL       : String?
    
    
    
    // MARK: - Init
    required init(imageID: String?,
                  imageTitle: String?,
                  imageCaption: String?,
                  imageURL: String?) {
        self.imageID = imageID
        self.imageTitle = imageTitle
        self.imageCaption = imageCaption
        self.imageURL = imageURL
    }
}
