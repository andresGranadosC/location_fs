//
//  ServiceManager.swift
//  LocationFS
//
//  Created by Andres Granados on 6/11/19.
//  Copyright © 2019 Andres Granados. All rights reserved.
//

import Alamofire

enum ResponseTypes: Error {
    
    case BadRequest
    case TimeOut
    case Successful
}

class ServiceManager {

    
    static func getVenues(url: String, completionHandler: @escaping (_ result: FSResponseRequest?, _ error: Error?) -> Void){
        
        
        Alamofire.request(url).responseData { response in
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
            
            guard let value = response.result.value else {
                return completionHandler(nil, ResponseTypes.BadRequest)
            }
            do {
                let JSONData = try JSONDecoder().decode(FSResponseRequest.self, from: value)
                
                return completionHandler(JSONData, nil)
                
            } catch let jsonError {
                return completionHandler(nil, jsonError)
            }
            
            
        }
    }
    
}
