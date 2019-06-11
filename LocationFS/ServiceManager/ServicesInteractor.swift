//
//  ServicesInteractor.swift
//  LocationFS
//
//  Created by Andres Granados on 6/11/19.
//  Copyright © 2019 Andres Granados. All rights reserved.
//


class ServicesInteractor {
    
    
    
    static func requestVenues(completionHandler: @escaping (_ result: FSResponseRequest?, _ error: Error?) -> Void){
        
        let basicURL = "https://api.foursquare.com/v2/venues/explore?"
        
        let client_id = "client_id=THIZC0VI0JOVPHJJJW1JIJNX5HWCTP1DCMQ1RJFE22IFL0OX&"
        let client_secret = "client_secret=VBYPUXJL044KXSUY2RYYRAVY4DRKJR4XFL3AKMD5VB1EYSJQ&"
        let date = "v=20180405&"
        let placeName = "near=NewYork"
        
        
        let url = basicURL+client_id+client_secret+date+date+placeName
        
        
        ServiceManager.getVenues(url: url) { (result, error) in
            
            completionHandler(result, error)
        }
        
        
    }
    
    

}
