//
//  DisplayTipViewController.swift
//  Tipsy
//
//  Created by Vaibhav Ranga on 22/03/24.
//

import UIKit

class DisplayTipViewController: UIViewController {

    @IBOutlet weak var amountPerPersonLabel: UILabel!
    @IBOutlet weak var splitBetweenLabel: UILabel!
    
    var amountPerPerson: String?
    var splitBetween: String?
    var tipPercentage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        amountPerPersonLabel.text = amountPerPerson
        splitBetweenLabel.text = "Split between \(splitBetween ?? "0") people, with \(tipPercentage ?? "0")% tip."
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
