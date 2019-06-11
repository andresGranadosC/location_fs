//
//  ViewController.swift
//  LocationFS
//
//  Created by Andres Granados on 6/11/19.
//  Copyright © 2019 Andres Granados. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var venuesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServicesInteractor.requestVenues { (responseRequest, error) in
            
            
        }
        
    }
    
    

    

}

