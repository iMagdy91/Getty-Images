//
//  ImageStore.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class GIImageStore: GIBaseStoreProtocol {
    
    // Default values
    static let defaultPageSize : Int = 10
    
    /**
     Get getty images from API.
     - Parameter api: API Type .gettyImage or .shutterstock
     - Parameter page: page number to request.
     - Parameter searchPhrase: search text if found.
     - Parameter success: response success block with GIImageViewModel.
     - Parameter failure: response failure block with Error.
     */
    func getDataForAPI(_ api: APIType,
                       page: Int,
                       searchPhrase: String?,
                       success: @escaping ViewModelClosure,
                       failure: @escaping ErrorClosure) {
        switch api {
        case .gettyImage:
            getGettyImagesInPage(page, searchPhrase: searchPhrase, success: success, failure: failure)
            break
        case .shutterstock:
            getShutterStockImagesInPage(page, searchPhrase: searchPhrase, success: success, failure: failure)
            break
        }
        
    }
    
    private func getShutterStockImagesInPage(_ page: Int,
                                             searchPhrase: String?,
                                             success: @escaping ViewModelClosure,
                                             failure: @escaping ErrorClosure) {
        var parametersDictonary: [String : Any] = [ShutterStockHeaders.pageKey : page,
                                                   ShutterStockHeaders.pageSizeKey : GIImageStore.defaultPageSize]
        if let searchText = searchPhrase {
            parametersDictonary.updateValue(searchText, forKey: ShutterStockHeaders.phraseKey)
        }
        
        
       // API Request
        GINetworkManager.performRequestWithPath(baseURL: Network.shutterStockBaseURL, authentication: AuthenticationTuple(needsAuthentication: true, username: Network.shutterStockAuthenticationID, password: Network.shutterStockAuthenticationSecret) , path: Network.shutterStockPath, requestMethod: .get, parameters: parametersDictonary, headers: nil, success: { (response) in
            let shutterStockModel: GIShutterStock? = Mapper<GIShutterStock>().map(JSONObject: response)
            let imageViewModelArray: [GIImageViewModel] = GIMappingManager.mapShutterStockToImageViewModel(shutterStockModel: shutterStockModel)
            
            success(imageViewModelArray)
        }, failure: failure)
    }
    
    private func getGettyImagesInPage(_ page: Int,
                                      searchPhrase: String?,
                                      success: @escaping ViewModelClosure,
                                      failure: @escaping ErrorClosure) {
        
        let headerDictionary: [String : String] = [GettyImagesHeaders.apiKey : Network.gettyImagesApikey]
        var parametersDictionary: [String : Any] = [GettyImagesHeaders.pageKey : page,
                                                    GettyImagesHeaders.pageSizeKey: GIImageStore.defaultPageSize]
        if let searchText = searchPhrase {
            parametersDictionary.updateValue(searchText, forKey: GettyImagesHeaders.phraseKey)
        }
        
        // API Request
        GINetworkManager.performRequestWithPath(path: Network.gettyImagespath, requestMethod: .get, parameters: parametersDictionary, headers: headerDictionary, success: { (response) in
            
            let gettyImage: GIGettyImage? = Mapper<GIGettyImage>().map(JSONObject: response)
            let imageViewModelArray: [GIImageViewModel] = GIMappingManager.mapGettyImageToImageViewModel(gettyImage: gettyImage)
            
            success(imageViewModelArray)
            
        }, failure: failure)
    }
    
    
    
}
