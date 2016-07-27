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
    
    @IBOutlet var minFretLabel: UILabel!
    
    @IBOutlet var markerFretSwitch: UISwitch!
    
    @IBOutlet var aFlatScaleSwitch: UISwitch!
    
    @IBOutlet var aScaleSwitch: UISwitch!
    
    @IBOutlet var bFlatScaleSwitch: UISwitch!
    
    @IBOutlet var bScaleSwitch: UISwitch!
    
    @IBOutlet var cScaleSwitch: UISwitch!
    
    @IBOutlet var cSharpSwitch: UISwitch!
    
    @IBOutlet var dFlatScaleSwitch: UISwitch!
    
    @IBOutlet var dScaleSwitch: UISwitch!
    
    @IBOutlet var eFlatSwitch: UISwitch!
    
    @IBOutlet var eScaleSwitch: UISwitch!
    
    @IBOutlet var fScaleSwitch: UISwitch!
    
    @IBOutlet var fSharpScaleSwitch: UISwitch!
    
    @IBOutlet var gFlatScaleSwitch: UISwitch!
    
    @IBOutlet var gMajorScaleSwitch: UISwitch!
    
    override func viewDidLoad() {
        lowEStringSwitch.enabled = settings.isStringEnabled(Guitar.lowEString)
        aStringSwitch.enabled = settings.isStringEnabled(Guitar.aString)
        dStringSwitch.enabled = settings.isStringEnabled(Guitar.dString)
        gStringSwitch.enabled = settings.isStringEnabled(Guitar.gString)
        bStringSwitch.enabled = settings.isStringEnabled(Guitar.bString)
        highEStringSwitch.enabled = settings.isStringEnabled(Guitar.hightEString)
        minFretSlider.value = Float(settings.getMinFret());
        minFretSlider.continuous = false
        markerFretSwitch.setOn(settings.getMarkerFrets(), animated: false)
        
        aFlatScaleSwitch.enabled = settings.isScaleEnabled(Scale.aFlatMajor())
        aScaleSwitch.enabled = settings.isScaleEnabled(Scale.aMajor())
        bScaleSwitch.enabled = settings.isScaleEnabled(Scale.bMajor())
        bFlatScaleSwitch.enabled = settings.isScaleEnabled(Scale.bFlatMajor())
        cScaleSwitch.enabled = settings.isScaleEnabled(Scale.cMajor())
        cSharpSwitch.enabled = settings.isScaleEnabled(Scale.cSharpMajor())
        dFlatScaleSwitch.enabled = settings.isScaleEnabled(Scale.dFlatMajor())
        dScaleSwitch.enabled = settings.isScaleEnabled(Scale.dMajor())
        eFlatSwitch.enabled = settings.isScaleEnabled(Scale.eFlatMajor())
        eScaleSwitch.enabled = settings.isScaleEnabled(Scale.eMajor())
        fScaleSwitch.enabled = settings.isScaleEnabled(Scale.fMajor())
        fSharpScaleSwitch.enabled = settings.isScaleEnabled(Scale.fSharpMajor())
        gFlatScaleSwitch.enabled = settings.isScaleEnabled(Scale.gFlatMajor())
        gMajorScaleSwitch.enabled = settings.isScaleEnabled(Scale.gMajor())
    }
    
    @IBAction func aFlatScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.aFlatMajor(), enabled: sender.on)
    }
    
    @IBAction func aScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.aMajor(), enabled: sender.on)
    }
    
    @IBAction func bFlatScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.bFlatMajor(), enabled: sender.on)
    }
    
    @IBAction func bScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.bMajor(), enabled: sender.on)
    }
    
    @IBAction func cScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.cMajor(), enabled: sender.on)
    }
    
    @IBAction func cSharpScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.cSharpMajor(), enabled: sender.on)
    }
    
    @IBAction func dFlatScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.dFlatMajor(), enabled: sender.on)
    }
    
    @IBAction func dScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.dMajor(), enabled: sender.on)
    }
    
    @IBAction func eFlatScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.eFlatMajor(), enabled: sender.on)
    }
    
    @IBAction func eScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.eMajor(), enabled: sender.on)
    }
    
    @IBAction func fScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.fMajor(), enabled: sender.on)
    }
    
    @IBAction func fSharpScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.fSharpMajor(), enabled: sender.on)
    }
    
    @IBAction func gFlatScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.gFlatMajor(), enabled: sender.on)
    }
    
    @IBAction func gScaleSwitched(sender: UISwitch) {
        settings.toggleScale(Scale.gMajor(), enabled: sender.on)
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