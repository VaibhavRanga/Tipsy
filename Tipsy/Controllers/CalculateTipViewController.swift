//
//  CalculateTipViewContrller.swift
//  Tipsy
//
//  Created by Vaibhav Ranga on 22/03/24.
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
        
        updateUi(for: tipButtonSelected)
    }

    @IBAction func tipButtonPressed(_ sender: UIButton) {
        let tipButtonSelected = tipsyBrain.selectedButton(buttonValue: sender.title(for: .normal)!)
        
        updateUi(for: tipButtonSelected)
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
    
    func updateUi(for tipButtonSelected: TipButtonSelected?) {
        zeroPercentTipButton.isSelected = tipButtonSelected!.zeroPercentTipButton
        tenPercentTipButton.isSelected = tipButtonSelected!.tenPercentTipButton
        twentyPercentTipButton.isSelected = tipButtonSelected!.twentyPercentTipButton
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
