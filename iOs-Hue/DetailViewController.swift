//
//  DetailViewController.swift
//  iOs-Hue
//
//  Created by Tobias Termeczky@hotmail.com on 19/09/2017.
//  Copyright © 2017 Tobias Termeczky@hotmail.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var BrightnessSlider: UISlider!
    @IBOutlet weak var SaturationSlider: UISlider!
    @IBOutlet weak var HueSlider: UISlider!
    @IBOutlet weak var lblHueId: UILabel!
    @IBOutlet weak var switchColorLoop: UISwitch!
    @IBOutlet weak var switchAlert: UISwitch!
    
    var baseUrl: String = ""
    var token: String = ""
    var hue : Hue?
    
    @IBAction func SliderBrightnessChanged(_ sender: UISlider) {
        let brightness = Int(BrightnessSlider.value)
        print("Brightness: \(brightness)")
        hue?.changeBrightness(url: "\(baseUrl)\(token)/lights/\(hue!.id)/state/", bri: brightness)
    }
    
    
    @IBAction func SliderSaturationChanged(_ sender: UISlider) {
        let saturation = Int(SaturationSlider.value)
        print("Saturation: \(saturation)")
        hue?.changeSaturation(url: "\(baseUrl)\(token)/lights/\(hue!.id)/state/", sat: saturation)
    }
    
    @IBAction func SliderActionChanged(_ sender: UISlider) {
        let mHue = Int(HueSlider.value)
        print("Hue: \(mHue)")
        hue?.setColor(url: "\(baseUrl)\(token)/lights/\(hue!.id)/state/", hue: mHue)
    }
    
    @IBAction func SwitchColorLoopChanged(_ sender: UISwitch) {
        if(sender.isOn){
        hue?.setColorloop(url: "\(baseUrl)\(token)/lights/\(hue!.id)/state/", b: true)
        } else {
        hue?.setColorloop(url: "\(baseUrl)\(token)/lights/\(hue!.id)/state/", b: false)
        }
    }

    @IBAction func SwitchAlertChanged(_ sender: UISwitch) {
        if(sender.isOn){
            hue?.setAlert(url: "\(baseUrl)\(token)/lights/\(hue!.id)/state/", b: true)
        } else {
            hue?.setAlert(url: "\(baseUrl)\(token)/lights/\(hue!.id)/state/", b: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHueId.text = hue!.name
        BrightnessSlider.setValue(Float((hue!.brightness)), animated: false)
        SaturationSlider.setValue(Float((hue!.sat)), animated: false)
        print("Hue: \(String(describing: hue?.hue))")
        HueSlider.setValue(Float((hue!.hue)), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        hue?.setDisco(url: "\(baseUrl)\(token)/lights/\(hue!.id)/state/")
    }
}
