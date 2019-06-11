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
    
    var responseRequest: FSResponseRequest?
    var venues: [Venue] = [] {
        didSet {
            self.venuesTableView.delegate = self
            self.venuesTableView.dataSource = self
            self.venuesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServicesInteractor.requestVenues { (responseRequest, error) in
            self.responseRequest = responseRequest
            self.loadVenues()
        }
        
    }
    
    func loadVenues() {
        
        if let responseRequest = responseRequest, responseRequest.response.groups.count > 0, let group = responseRequest.response.groups.first  {
            
            let venues = group.items.map { (item) -> Venue in
                
                return item.venue
                }
            
            self.venues = venues
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.venues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VenueCell") as? VenueTableViewCell
        
        cell?.textLabel?.text = venues[indexPath.row].name
        cell?.detailTextLabel?.text = "\(venues[indexPath.row].location.lat) \(venues[indexPath.row].location.lng)"
        
        return cell ?? UITableViewCell()
    }
    
    
}

