//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jimmy Chen on 3/3/17.
//  Copyright © 2017 Jimmy Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
   


    @IBOutlet weak var tipValueLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tipPercentage:Double = Double(Int(tipSlider.value));
        tipValueLabel.text = String(format: "%.0f", tipPercentage)
        let tip = bill * (tipPercentage/100);
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        let index:Double = Double(segmentedControl.selectedSegmentIndex)
        splitLabel.text = String(format: "$%.2f", total/(index+1))
        let defaults = UserDefaults.standard
        defaults.set(bill, forKey:"bill")
        defaults.set(tipPercentage, forKey:"default_tip");
        defaults.synchronize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       

    }
    override func viewDidAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        var tipValue = defaults.integer(forKey:"default_tip")
        if tipValue == 0 {
            tipValue = 20
        }
        tipSlider.value = Float(tipValue)
        tipValueLabel.text = String(format: "%.0f", tipValue)
        let bill = defaults.double(forKey:"bill")
        billField.text=String(bill);

    }
    

}

