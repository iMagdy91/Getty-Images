//
//  NetworkManager.swift
//  GettyImages
//
//  Created by Mohamed Magdy on 7/15/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkSuccessClosure     = (Any?) -> Void
typealias NetworkErrorClosure       = (Error) -> Void
typealias AuthenticationTuple = (needsAuthentication:Bool, username: String?, password: String?)

class GINetworkManager {
    
    /**
     Requests data from API and get the response back.
     
     - Paramter  baseURL: Base URL for the API.. Default value is https://api.gettyimages.com:443/
     - Parameter path: API path.
     - Parameter requestMethod: request method .GET .POST etc..
     - Parameter parameters: request parameters.
     - Parameter headers: request headers.
     - Parameter success: response success block.
     - Parameter failure: response failure block.
     */
    
    class func performRequestWithPath(baseURL: String = Network.gettyImagesbaseURL,
                                      authentication: AuthenticationTuple = (false, nil, nil),
                                      path: String?,
                                      requestMethod: Alamofire.HTTPMethod,
                                      parameters: [String : Any]?,
                                      headers: [String : String]?,
                                      success: @escaping NetworkSuccessClosure,
                                      failure: @escaping NetworkErrorClosure) {
            
        let url = (path != nil) ? baseURL + path! : baseURL
        var mutableHeaders = headers
        if authentication.needsAuthentication {
            let user = authentication.username ?? ""
            let password = authentication.password ?? ""
            let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
            let base64Credentials = credentialData.base64EncodedString(options: [])
            mutableHeaders = ["Authorization": "Basic \(base64Credentials)"]
        }
        
        Alamofire.request(url, method: requestMethod, parameters: parameters, headers: mutableHeaders)
            .validate()
            .responseJSON { response in
                
                switch response.result {
                    
                case .success(_):
                    success(response.result.value)
                case .failure(let error):
                    failure(error)
                }
        }
    }
}
