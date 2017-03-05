//
//  ViewController.swift
//  tip
//
//  Created by Dhruv Kalaria on 3/4/17.
//  Copyright © 2017 Dhruv Kalaria. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SettingsViewControllerDelegate {
    
    @IBOutlet weak var tipPercent: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var billIncludingTip: UILabel!
    @IBOutlet weak var numberOfPeople: UILabel!
    @IBOutlet weak var splitAmount: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    var billValue: String = "0.00"
    var tipPercentValue: String = "0"
    var splitValue = "1"
    
    var maxTipPercentage: String = "99"
    var maxPeopleCount: String = "10"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        configure()
        reset()
        billAmount.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipPercentChanged(_ sender: Any) {
        tipPercentValue = String(format: "%.0f", tipSlider.value)
        tipPercent.text = tipPercentValue + "%"
        tipAmount.text = String(format: "%.2f", Float(billValue)! * 0.01 * Float(tipPercentValue)!)
        billAmoutChanged(nil)
    }
    
    @IBAction func splitNumberChanged(_ sender: Any) {
        splitValue = String(format: "%.0f", splitSlider.value)
        numberOfPeople.text = splitValue
        billAmoutChanged(nil)
    }
    
    @IBAction func billAmoutChanged(_ sender: UITextField?) {
        billValue = billAmount.text!
        if billValue == "" {
            billValue = "0.00"
        }
        let total = Float(billValue)! * (1 + 0.01 * Float(tipPercentValue)!)
        billIncludingTip.text = String(format: "%.2f",total)
        splitAmount.text = String(format: "%.2f",total / Float(splitValue)!)
    }
    
    @IBAction func billAmountEdited(_ sender: Any) {
        splitAmount.text = "0.00"
        billIncludingTip.text = "0.00"
    }
    @IBAction func settingsButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "settings") as! SettingsViewController
        controller.delegate=self
        controller.maxTipPercentage = self.maxTipPercentage
        controller.maxPeopleCount = self.maxPeopleCount
        self.show(controller, sender: sender)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func passData(tip: String?, people: String?) {
        self.maxTipPercentage = tip!
        self.maxPeopleCount=people!
        tipSlider.maximumValue = Float(tip!)!
        splitSlider.maximumValue = Float(people!)!
        reset()
    }
    
}

extension ViewController {
    
    func configure() {
        navigationItem.title = "Tip Calculator"
        billAmount.keyboardType = .decimalPad
    }
    
    func reset() {
        tipSlider.value = 0
        splitSlider.value = 1
        tipPercent.text = "0%"
        numberOfPeople.text = "1"
    }
}
