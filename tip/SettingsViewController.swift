//
//  SettingsViewController.swift
//  tip
//
//  Created by Dhruv Kalaria on 3/5/17.
//  Copyright © 2017 Dhruv Kalaria. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    @IBOutlet weak var maxTipPercent: UILabel!
    @IBOutlet weak var stepMaxTipPercent: UIStepper!
    @IBOutlet weak var maxPeopleSplit: UIStepper!
    @IBOutlet weak var maxPeople: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeMaxTipPercent(_ sender: UIStepper) {
        maxTipPercent.text = String(format: "%.0f", stepMaxTipPercent.value)
    }
    
    @IBAction func maxPeopleSplit(_ sender: UIStepper) {
        maxPeople.text = String(format: "%.0f", maxPeopleSplit.value)
    }

}

extension SettingsViewController {
    func config() {
        self.navigationItem.title = "Settings"
    }
}
