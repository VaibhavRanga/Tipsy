//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Vaibhav Ranga on 22/03/24.
//

import Foundation

struct TipsyBrain {
    private var tipButtonSelected = TipButtonSelected(
        zeroPercentTipButton: false,
        tenPercentTipButton: true,
        twentyPercentTipButton: false,
        tipPercentageValue: 10
    )
    private var splitValue = 2.0
    private var amountPerPerson = 0.0
    
    mutating func selectedButton(buttonValue: String?) -> TipButtonSelected {
        if buttonValue == "0%" {
            tipButtonSelected.zeroPercentTipButton = true
            tipButtonSelected.tenPercentTipButton = false
            tipButtonSelected.twentyPercentTipButton = false
            tipButtonSelected.tipPercentageValue = 0
        } else if buttonValue == "10%" {
            tipButtonSelected.zeroPercentTipButton = false
            tipButtonSelected.tenPercentTipButton = true
            tipButtonSelected.twentyPercentTipButton = false
            tipButtonSelected.tipPercentageValue = 10
        } else if buttonValue == "20%" {
            tipButtonSelected.zeroPercentTipButton = false
            tipButtonSelected.tenPercentTipButton = false
            tipButtonSelected.twentyPercentTipButton = true
            tipButtonSelected.tipPercentageValue = 20
        }
        
        return tipButtonSelected
    }
    
    mutating func updateSplitValue(split: Double) {
        splitValue = split
    }
    
    mutating func calculateResult(billAmount: String) {
        let billAmountInDouble = Double(billAmount) ?? 0.0
        let tip = (billAmountInDouble * tipButtonSelected.tipPercentageValue) / 100
        
        amountPerPerson = (billAmountInDouble + tip) / splitValue
    }
    
    func getSplitValue() -> String {
        let splitStringValue = String(format: "%.0f", splitValue)
        return splitStringValue
    }
    
    func getAmountPerPerson() -> String {
        let amountPerPersonString = String(format: "%.2f", amountPerPerson)
        return amountPerPersonString
    }
    
    func getTipPercentage() -> String {
        let tipPercentageString = String(format: "%.0f", tipButtonSelected.tipPercentageValue)
        return tipPercentageString
    }
}
