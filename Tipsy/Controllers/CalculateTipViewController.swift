//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateTipViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var zeroPercentTipButton: UIButton!
    @IBOutlet weak var tenPercentTipButton: UIButton!
    @IBOutlet weak var twentyPercentTipButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    
    var tipsyBrain = TipsyBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tipButtonSelected = tipsyBrain.selectedButton(buttonValue: nil)
        
        zeroPercentTipButton.isSelected = tipButtonSelected.zeroPercentTipButton
        tenPercentTipButton.isSelected = tipButtonSelected.tenPercentTipButton
        twentyPercentTipButton.isSelected = tipButtonSelected.twentyPercentTipButton
    }

    @IBAction func tipButtonPressed(_ sender: UIButton) {
        let tipButtonSelected = tipsyBrain.selectedButton(buttonValue: sender.title(for: .normal)!)
        
        zeroPercentTipButton.isSelected = tipButtonSelected.zeroPercentTipButton
        tenPercentTipButton.isSelected = tipButtonSelected.tenPercentTipButton
        twentyPercentTipButton.isSelected = tipButtonSelected.twentyPercentTipButton
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        splitLabel.text = "\(stepperValue)"
        tipsyBrain.updateSplitValue(split: sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        tipsyBrain.calculateResult(billAmount: billAmountTextField.text!)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! DisplayTipViewController
            destinationVC.amountPerPerson = tipsyBrain.getAmountPerPerson()
            destinationVC.splitBetween = tipsyBrain.getSplitValue()
            destinationVC.tipPercentage = tipsyBrain.getTipPercentage()
        }
    }
}
