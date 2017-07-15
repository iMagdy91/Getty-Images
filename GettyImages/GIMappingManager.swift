//
//  MappingManager.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation

class GIMappingManager {
    
    /**
     Map GIGettyImage to GIImageViewModel.
     
     - Parameter gettyImage: GIGettyImage to be mapped.
     - Returns : mapped GIImageViewModel array.
.
     */
    
    class func mapGettyImageToImageViewModel(gettyImage: GIGettyImage?) -> [GIImageViewModel] {
        var imagesViewModel = [GIImageViewModel]()
        
        if let gettyImageModel = gettyImage, let images = gettyImageModel.images {
            for image in images {
                let imageViewModel: GIImageViewModel = GIImageViewModel(imageID: image.imageID, imageTitle: image.title, imageCaption: image.caption, imageURL: image.displaySizes?.first?.url)
                imagesViewModel.append(imageViewModel)
            }
        }
        
        return imagesViewModel
    }
    
}
