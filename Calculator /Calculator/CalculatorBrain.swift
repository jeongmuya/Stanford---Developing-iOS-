//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by YangJeongMu on 10/26/25.
//

import Foundation

class CalculatorBrain {
    
    private var accumulator = 0.0
    
    func setOperand(operand: Double) {
        accumulator = operand
    }
    
    func performOperation(symbol: String) {
        switch symbol {
        case "𝞹" : accumulator = Double.pi
        case "√" : accumulator = sqrt(accumulator)
        default : break
        }
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
