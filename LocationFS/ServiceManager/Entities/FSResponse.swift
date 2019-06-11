//
//  FSResponse.swift
//  LocationFS
//
//  Created by Andres Granados on 6/11/19.
//  Copyright © 2019 Andres Granados. All rights reserved.
//

import Foundation

struct FSResponse: Decodable {
    
    let geocode: [String: String]
    let groups: [FSItem]
    
    
}
