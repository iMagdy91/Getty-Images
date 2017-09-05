//
//  GettyImageDTO.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

// DTO Class to parse content of GettyImages API into.
class GIGettyImage: GIBaseMappable {
    
    // MARK: - Properties
    private(set) var resultCount: Int?
    private(set) var images     : [GIImageModel]?
    
    
    /** 
     Mapping from API
    */
    override func mapping(map: Map) {
        resultCount <- map["result_count"]
        images      <- map["images"]
    }
}

class GIImageModel: GIBaseMappable {
    
    // MARK: - Properties
    private(set) var assetFamily    : String?
    private(set) var caption        : String?
    private(set) var collectionCode : String?
    private(set) var collectionID   : Int?
    private(set) var collectionName : String?
    private(set) var displaySizes   : [GIImageDisplaySize]?
    private(set) var imageID        : String?
    private(set) var licenseModel   : String?
    private(set) var maxDimention   : GIImageDimention?
    private(set) var title          : String?
    
   
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        assetFamily     <- map["asset_family"]
        caption         <- map["caption"]
        collectionCode  <- map["collection_code"]
        collectionID    <- map["collection_id"]
        collectionName  <- map["collection_name"]
        displaySizes    <- map["display_sizes"]
        imageID         <- map["id"]
        licenseModel    <- map["license_model"]
        maxDimention    <- map["max_dimensions"]
        title           <- map["title"]
    }
}

class GIImageDisplaySize: GIBaseMappable {
    
    // MARK: - Properties
    private(set) var isWatedmarked  : Bool?
    private(set) var name           : String?
    private(set) var url            : String?
    
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        isWatedmarked  <- map["is_watermarked"]
        name           <- map["name"]
        url            <- map["uri"]
    }
}

class GIImageDimention: GIBaseMappable {
    
    // MARK: - Properties
    private(set) var height         : Float?
    private(set) var width          : Float?
    
    
    /**
     Mapping from API
     */
    override func mapping(map: Map) {
        height          <- map["height"]
        width           <- map["width"]
    }
}

