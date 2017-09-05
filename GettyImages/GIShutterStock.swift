//
//  GIShutterStock.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 9/5/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

// DTO Class to parse content of ShutterStock API into.
class GIShutterStock: GIBaseMappable {
    
    // MARK: - Properties
    private(set) var page       : Int?
    private(set) var perPage    : Int?
    private(set) var totalCount : Int?
    private(set) var searchID   : String?
    private(set) var data       : [GIShutterStockData]?

    
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        page <- map["page"]
        perPage <- map["per_page"]
        totalCount <- map["total_count"]
        searchID <- map["search_id"]
        data <- map["data"]
    }

}

class GIShutterStockData: GIBaseMappable {
    
    // MARK: - Properties
    private(set) var aspect     : Int?
    private(set) var assets     : GIAssets?
    private(set) var contributor: GIContributor?
    private(set) var description: String?
    private(set) var id         : String?
    private(set) var imageType  : String?
    private(set) var mediaType  : String?
    
    
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        aspect <- map["aspect"]
        assets <- map["assets"]
        contributor <- map["contributor"]
        description <- map["description"]
        id <- map["id"]
        imageType <- map["image_type"]
        mediaType <- map["media_type"]
    }
}

class GIContributor: GIBaseMappable {
    
    // MARK: - Properties
    private(set) var id         : String?
    
    
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        id <- map["id"]
    }
}

class GIAsset: GIBaseMappable {
    
    // MARK: - Properties
    private(set) var height     : Int?
    private(set) var url        : String?
    private(set) var width      : Int?
    
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        height <- map["height"]
        url <- map["url"]
        width <- map["width"]
    }
}

class GIAssets: GIBaseMappable {
    
    // MARK: - Properties
    private(set) var preview     : GIAsset?
    private(set) var smallThumb  : GIAsset?
    private(set) var largeThumb  : GIAsset?
    
 
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        preview <- map["preview"]
        smallThumb <- map["small_thumb"]
        largeThumb <- map["large_thumb"]

    }
    
    

}
