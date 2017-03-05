//
//  ViewController.swift
//  tip
//
//  Created by Dhruv Kalaria on 3/4/17.
//  Copyright © 2017 Dhruv Kalaria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipPercent: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var billIncludingTip: UILabel!
    @IBOutlet weak var numberOfPeople: UILabel!
    @IBOutlet weak var splitAmount: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var splitSlider: UISlider!
    
    var billStr = "0.00"
    var tipStr = "0.00"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        tipPercent.text = "0%"
        numberOfPeople.text = "1"
        billAmount.text="0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipPercentChanged(_ sender: Any) {
        tipPercent.text = String(format: "%.0f", tipSlider.value) + "%"
        tipAmount.text = String(format: "%.2f",Float(billStr)! * 0.01 * Float(tipStr)!)
        billAmoutChanged(nil)
    }
    
    @IBAction func splitNumberChanged(_ sender: Any) {
        numberOfPeople.text = String(format: "%.0f",splitSlider.value)
        splitAmount.text = String(format: "%.2f",Float(billIncludingTip.text!)!/Float(numberOfPeople.text!)!)
    }
    
    @IBAction func billAmoutChanged(_ sender: UITextField?) {
        billStr = (billAmount.text?.replacingOccurrences(of: "$", with: ""))!
        tipStr = (tipPercent.text?.replacingOccurrences(of: "%", with: ""))!
        billIncludingTip.text = String(format: "%.2f",Float(billStr)! * (1 + 0.01 * Float(tipStr)!))
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}

