//
//  HueTableViewController.swift
//  iOs-Hue
//
//  Created by Tobias Termeczky@hotmail.com on 18/09/2017.
//  Copyright © 2017 Tobias Termeczky@hotmail.com. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HueTableViewController: UITableViewController {
    
    var hues: [Hue] = []
    var baseUrl: String = ""
    var token: String = ""
    
    func getHues(url: String, token: String) {
        
        let url = "\(url)\(token)/lights"
        print(url)
        
        Alamofire.request(url,
                          method: .get,
                          encoding: URLEncoding.default).responseJSON { (responseData) -> Void in
                            if((responseData.result.value) != nil) {
                                let results = JSON(responseData.result.value!)
                                
                                for(key, result) in results {
                                    let hue = Hue()
                                    let id = String(key)
                                    let name = result["name"].string
                                    let on = result["state"]["on"].bool
                                    let bri = result["state"]["bri"].int
                                    
                                    if let sat = result["state"]["sat"].int {
                                        hue.sat = sat
                                    }
                                    
                                    if let mHue = result["state"]["hue"].int {
                                        hue.hue = mHue
                                    }
                                    
                                    let mHue = result["state"]["hue"].int
                                    if (mHue == nil){
                                        print("empty")
                                    }else{
                                        print(mHue!)
                                        hue.id = id!
                                        hue.name = name!
                                        hue.brightness = bri!
                                        
                                        hue.on = on!
                                        
                                        
                                        self.hues.append(hue)
                                    }
                                }
                                self.tableView.reloadData()
                            }
        }
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        for hue in hues {
        hue.setDisco(url: "\(baseUrl)\(token)/lights/\(hue.id)/state/")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getHues(url: self.baseUrl, token: self.token)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.isUserInteractionEnabled = true
        let row = (indexPath as NSIndexPath).row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hueCell", for: indexPath) as! HueTableViewCell
        
        cell.lblHueId.text = hues[row].name
        cell.switchHueId.setOn(hues[row].on, animated: false)
        cell.HueId = hues[row].id
        cell.baseUrl = self.baseUrl
        cell.token = self.token
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hueDetailSegue" {
            if let destination = segue.destination as? DetailViewController {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let hue = hues [(indexPath as NSIndexPath).row]
                    destination.hue = hue
                    destination.baseUrl = self.baseUrl
                    destination.token = self.token
                }
            }
        }
    }

}
