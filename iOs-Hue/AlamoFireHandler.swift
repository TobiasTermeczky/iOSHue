//
//  AlamoFireHandler.swift
//  iOs-Hue
//
//  Created by Tobias Termeczky@hotmail.com on 18/09/2017.
//  Copyright © 2017 Tobias Termeczky@hotmail.com. All rights reserved.
//

import Alamofire
import SwiftyJSON

public class AlamoFireHandler {
    func doRequest(url: String, parameters: [String : Any], method: HTTPMethod)
    {
        Alamofire.request(url,
                          method: method,
                          parameters: parameters,
                          encoding: JSONEncoding.default).responseJSON { (responseData) -> Void in
                            if((responseData.result.value) != nil){
                                let results = JSON(responseData.result.value!)
                                print("Respone \(results)")
                            }
        }
    }
}
