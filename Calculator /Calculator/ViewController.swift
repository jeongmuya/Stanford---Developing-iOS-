//
//  ViewController.swift
//  Calculator
//
//  Created by YangJeongMu on 10/25/25.
//

import UIKit // 모듈

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        guard let digit = sender.configuration?.title else { return } // 버튼 누르면 숫자 가 나옴 해당 현재 타이틀을 이용해서
        
        // 소수점 처리
          if digit == "." {
              if display.text!.contains(".") {
                  return // 이미 소수점이 있으면 무시
              }
              if !userIsInTheMiddleOfTyping {
                  display.text = "0." // 처음에 .을 누르면 0.으로 시작
                  userIsInTheMiddleOfTyping = true
                  return
              }
          }
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text! // 기존 숫자 값
            display.text = textCurrentlyInDisplay + digit // 기존 숫자 값 + 내가 누른 숫자
        } else {
            display.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!) ?? 0
        }
        set {
            display.text = String(newValue)
        }
    }
    
    var savedProgram: CalculatorBrain.PropertyList?
    
    @IBAction func save() {
        savedProgram = brain.program
    }
    
    @IBAction func restore() {
        if savedProgram != nil {
            brain.program = savedProgram!
            displayValue = brain.result
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        guard let mathematicalSymbol = sender.configuration?.title else { return }
        brain.performOperation(symbol: mathematicalSymbol)
        
        displayValue = brain.result
       }
        
    }
