//
//  ViewController.swift
//  Calculator
//
//  Created by siwook on 2017. 4. 10..
//  Copyright © 2017년 siwook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var display: UILabel!
  var userIsInTheMiddleOfTyping = false
  private var brain = CalculatorBrain()
  
  var displayValue : Double {
    get {
      return Double(display.text!)!
    }
    set {
      display.text = String(newValue)
    }
  }
  
  @IBAction func touchDigit(_ sender: UIButton) {
    let digit = sender.currentTitle!
    
    if userIsInTheMiddleOfTyping {
      let textCurrentlyInDisplay = display.text!
      display.text = textCurrentlyInDisplay + digit
    } else {
      display.text = digit
      userIsInTheMiddleOfTyping = true
    }
    
  }
  
  
  
  @IBAction func performOperation(_ sender: UIButton) {
    
    if userIsInTheMiddleOfTyping {
      brain.setOperand(displayValue)
      userIsInTheMiddleOfTyping = false
    }
    
    if let mathematicalSymbol = sender.currentTitle {
      brain.performOperation(mathematicalSymbol)
    }
    
    if let result = brain.result {
      displayValue = result
    }
    
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  
}

