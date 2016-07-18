//
//  SettingsViewController.swift
//  GuitarShapes
//
//  Created by Corin Blaikie on 20/08/2015.
//  Copyright (c) 2015 Corin Blaikie. All rights reserved.
//

import UIKit

class SettingsViewController : UITableViewController {
    
    var settings:Settings = Settings.instance
    
    @IBOutlet var lowEStringSwitch: UISwitch!
    
    @IBOutlet var aStringSwitch: UISwitch!
    
    @IBOutlet var dStringSwitch: UISwitch!
    
    @IBOutlet var gStringSwitch: UISwitch!
    
    @IBOutlet var bStringSwitch: UISwitch!
    
    @IBOutlet var highEStringSwitch: UISwitch!
    
    @IBOutlet var minFretSlider: UISlider!
    
    //@IBOutlet var maxFretSlider: UISlider!
    
    @IBOutlet var minFretLabel: UILabel!
    
    //@IBOutlet var maxFretLabel: UILabel!
    
    @IBOutlet var markerFretSwitch: UISwitch!
    override func viewDidLoad() {
        lowEStringSwitch.enabled = settings.isStringEnabled(Guitar.lowEString)
        aStringSwitch.enabled = settings.isStringEnabled(Guitar.aString)
        dStringSwitch.enabled = settings.isStringEnabled(Guitar.dString)
        gStringSwitch.enabled = settings.isStringEnabled(Guitar.gString)
        bStringSwitch.enabled = settings.isStringEnabled(Guitar.bString)
        highEStringSwitch.enabled = settings.isStringEnabled(Guitar.hightEString)
        minFretSlider.value = Float(settings.getMinFret());
        //maxFretSlider.value = Float(settings.getMaxFret());
        //maxFretSlider.minimumValue = minFretSlider.value
        //minFretSlider.maximumValue = maxFretSlider.value
        
        minFretSlider.continuous = false
        //maxFretSlider.continuous = false
        markerFretSwitch.setOn(settings.getMarkerFrets(), animated: false)
    }
    
    @IBAction func maxFretSliderValueChanged(sender: UISlider) {
        sender.value = Float(Int(sender.value))
        settings.setMaxFret(Int(sender.value))
        //maxFretLabel.text = "Max Fret: \(sender.value)"
    }
    
    @IBAction func minFretSliderValueChanged(sender: UISlider) {
        sender.value = Float(Int(sender.value))
        settings.setMinFret(Int(sender.value))
        minFretLabel.text = "Min Fret: \(sender.value)"
    }
    
    @IBAction func OnLowESwitched(sender: UISwitch) {
        settings.toggleString(Guitar.lowEString, enabled: sender.on)
    }
    
    @IBAction func onAStringSwitched(sender: UISwitch) {
        settings.toggleString(Guitar.aString, enabled: sender.on)
    }
    
    @IBAction func onDStringSwitched(sender: UISwitch) {
        settings.toggleString(Guitar.dString, enabled: sender.on)
    }
    
    @IBAction func onGStringSwitched(sender: UISwitch) {
        settings.toggleString(Guitar.gString, enabled: sender.on)
    }
    
    @IBAction func onBStringSwitched(sender: UISwitch) {
        settings.toggleString(Guitar.bString, enabled: sender.on)
    }
    
    @IBAction func onHighESwitched(sender: UISwitch) {
        settings.toggleString(Guitar.hightEString, enabled: sender.on)
    }
    
    @IBAction func onMarkerFretsSwiched(sender: UISwitch) {
        settings.toggleMarkerFrets(sender.on)
    }
}