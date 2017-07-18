//
//  ImageStore.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

// API paramters and headers
fileprivate let apiKey          : String = "Api-Key"
fileprivate let pageKey         : String = "page"
fileprivate let pageSizeKey     : String = "page_size"
fileprivate let phraseKey       : String = "phrase"



class GIImageStore: GIBaseStoreProtocol {
    
    // Default values
    static let defaultPageSize : Int = 10
    
    /**
     Get getty images from API.
     
     - Parameter page: page number to request.
     - Parameter searchPhrase: search text if found.
     - Parameter success: response success block with GIImageViewModel.
     - Parameter failure: response failure block with Error.
     */
    
     func getImagesInPage(page: Int,
                               searchPhrase: String?,
                               success: @escaping ViewModelClosure,
                               failure: @escaping ErrorClosure) {
        
        let headerDictionary: [String : String] = [apiKey : Network.api_key]
        var parametersDictionary: [String : Any] = [pageKey : page,
                                                    pageSizeKey: GIImageStore.defaultPageSize]
        if let searchText = searchPhrase {
            parametersDictionary.updateValue(searchText, forKey: phraseKey)
        }
        
        // API Request
        GINetworkManager.performRequestWithPath(path: Network.path, requestMethod: .get, parameters: parametersDictionary, headers: headerDictionary, success: { (response) in
            
            let gettyImage: GIGettyImage? = Mapper<GIGettyImage>().map(JSONObject: response)
            let imageViewModelArray: [GIImageViewModel] = GIMappingManager.mapGettyImageToImageViewModel(gettyImage: gettyImage)
            
            success(imageViewModelArray)
            
        }) { (error) in
            failure(error)
        }
    }
    
}
