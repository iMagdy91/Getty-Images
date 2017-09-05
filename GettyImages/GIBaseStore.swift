//
//  BaseStore.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation

enum APIType  {
    case gettyImage
    case shutterstock
    
}

protocol GIBaseStoreProtocol {
    
    typealias ErrorClosure      = (Error) -> Void
    typealias ViewModelClosure  = ([GIBaseViewModel]?) -> Void

    // MARK: - GIBaseStoreProtocol Methods
    func getDataForAPI(_ api: APIType,
                       page: Int,
                       searchPhrase: String?,
                       success: @escaping ViewModelClosure,
                       failure: @escaping ErrorClosure)
    
}
