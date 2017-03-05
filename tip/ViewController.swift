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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipPercentChanged(_ sender: Any) {
    }
    
    @IBAction func splitNumberChanged(_ sender: Any) {
    }
}

