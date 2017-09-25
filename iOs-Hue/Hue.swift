//
//  Hue.swift
//  iOs-Hue
//
//  Created by Tobias Termeczky@hotmail.com on 18/09/2017.
//  Copyright © 2017 Tobias Termeczky@hotmail.com. All rights reserved.
//

import UIKit

class Hue {
    var id = String()
    var on = Bool()
    var brightness = Int()
    var name = String()
    var effect = String()
    var alert = String()
    var sat = Int()
    var hue = Int()
    var x = Float()
    var y = Float()
    
    let ah = AlamoFireHandler()
    
    func turnOn(url: String){
        let parameters = ["on": true]
        ah.doRequest(url: url, parameters: parameters, method: .put)
        on = true
    }
    
    func turnOff(url: String){
        let parameters = ["on": false]
        ah.doRequest(url: url, parameters: parameters, method: .put)
        on = false
    }
    
    func changeBrightness(url: String, bri: Int){
        print("Input \(bri)")
        print("Url \(url)")
        let parameters = ["bri": bri]
        print("Parameters \(parameters)")
        ah.doRequest(url: url, parameters: parameters, method: .put)
        brightness = bri
    }
    
    func setColor(url: String, hue: Int){
        let parameters = ["hue": hue]
        ah.doRequest(url: url, parameters: parameters, method: .put)
        self.hue = hue
    }
    
    func changeSaturation(url: String, sat: Int){
        let parameters = ["sat": sat]
        ah.doRequest(url: url, parameters: parameters, method: .put)
        self.sat = sat
    }
    
    func setColorloop(url: String, b: Bool){
        var parameters = ["effect": "colorloop"]
        if !b {
            parameters = ["effect": "none"]
        }
        
        ah.doRequest(url: url, parameters: parameters, method: .put)
    }
    
    func setAlert(url: String, b: Bool){
        var parameters = ["alert": "lselect"]
        if !b {
            parameters = ["alert": "none"]
        }
        ah.doRequest(url: url, parameters: parameters, method: .put)
    }
    
    func setDisco(url: String){
        print("Disco")
        let parameters = ["effect": "colorloop", "alert": "lselect"]
        
        ah.doRequest(url: url, parameters: parameters, method: .put)
        
    }
    
    
}
