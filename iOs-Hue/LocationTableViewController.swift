//
//  LocationTableViewController.swift
//  iOs-Hue
//
//  Created by Tobias Termeczky@hotmail.com on 18/09/2017.
//  Copyright © 2017 Tobias Termeczky@hotmail.com. All rights reserved.
//

import UIKit

class LocationTableViewController: UITableViewController {

    var locations: [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let l1 = Location()
        l1.name = "LA134"
        l1.ipAdress = "http://192.168.1.179/api/"
        l1.token = "M4MLKGnNIs-FIcksCcAGGGt-Kjb3hXpEkMUFEIco"
        
        self.locations.append(l1)
        
        let l2 = Location()
        l2.name = "Avans Aula LA"
        l2.ipAdress = "http://145.48.205.33/api/"
        l2.token = "iYrmsQq1wu5FxF9CPqpJCnm1GpPVylKBWDUsNDhB"
        
        self.locations.append(l2)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = (indexPath as NSIndexPath).row
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! LocationTableViewCell
        cell.lblLocationName.text = locations[row].name

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LocationToHueSegue" {
            if let destinnation = segue.destination as? HueTableViewController {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let location = locations[(indexPath as NSIndexPath).row]
                    destinnation.baseUrl = location.ipAdress
                    destinnation.token = location.token
                }
            }
        }
    }

}
