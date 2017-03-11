//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Jimmy Chen on 3/10/17.
//  Copyright © 2017 Jimmy Chen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipField: UITextField!
    @IBOutlet weak var colorThemeSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    

    @IBAction func colorThemeSwitchChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(colorThemeSwitch.isOn, forKey:"color_theme")
        defaults.synchronize()
    }
    @IBAction func defaultTipPercentageChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        let defaultTip = Float(defaultTipField.text!) ?? 20.0
        defaults.set(defaultTip, forKey:"default_tip")
        print("default_tip: " + defaults.string(forKey: "default_tip")!)
        defaults.synchronize()
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewWillAppear(animated)
                
    }


}
