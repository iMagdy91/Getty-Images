//
//  Utils.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import UIKit

struct Network {
    //GettyImages API
    static let gettyImagesbaseURL                = "https://api.gettyimages.com:443/"
    static let gettyImagespath                   = "v3/search/images"
    static let gettyImagesApikey                 = "eppmeywp49apdmk928znjzc5"
    
    //ShutterStock API
    static let shutterStockBaseURL               = "https://api.shutterstock.com/"
    static let shutterStockPath                  = "v2/images/search"
    static let shutterStockAuthenticationID      = "9d12ae0368b0fcf7d981"
    static let shutterStockAuthenticationSecret  = "5c92e87786a6afdb2b7b93784d6d1d4fe0b04275"
}

struct UITableViewConstants {
    static let estimatedRowHeight       :CGFloat = 110.0
}

struct UITableViewCellIdentifier {
    static let gettyCellIdentifier      :String  = "Getty Cell"
}

struct GettyImagesHeaders {
    static let apiKey                   : String = "Api-Key"
    static let pageKey                  : String = "page"
    static let pageSizeKey              : String = "page_size"
    static let phraseKey                : String = "phrase"
 
}

struct ShutterStockHeaders {
    static let pageKey                  : String = "page"
    static let pageSizeKey              : String = "per_page"
    static let phraseKey                : String = "query"
}
