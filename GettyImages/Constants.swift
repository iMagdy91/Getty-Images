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
    static let baseURL                           = "https://api.gettyimages.com:443/"
    static let path                              = "v3/search/images"
    static let api_key                           = "954b6yfa3xpdjc5h795gs7zu"
}

struct ImageViewStruct {
    static let estimatedRowHeight       :CGFloat = 120.0
}

struct UITableViewCellIdentifier {
    static let gettyCellIdentifier      :String  = "Getty Cell"
}
