//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by siwook on 2017. 4. 11..
//  Copyright © 2017년 siwook. All rights reserved.
//

import Foundation


func changeSign(operand : Double)-> Double {
  return -operand
}

func multiply(operand1: Double, operand2:Double) -> Double {
  return operand1 * operand2
}

struct CalculatorBrain {
  
  private var accumulator : Double?
  
  private enum Operation {
    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double,Double)->Double)
    case equals
  }
  
 
  private var operations:Dictionary<String,Operation> = [
    "π"   : Operation.constant(Double.pi),
    "e"   : Operation.constant(M_E),
    "√"   : Operation.unaryOperation(sqrt),
    "cos" : Operation.unaryOperation(cos),
    "±"   : Operation.unaryOperation(changeSign),
    "x"   : Operation.binaryOperation(multiply),
    "="   : Operation.equals
  ]
  
  
  
  mutating func performOperation(_ symbol:String) {
  
    if let operation = operations[symbol] {
      switch operation {
      case .constant(let value) :
        accumulator = value
      case .unaryOperation(let function):
        if accumulator != nil {
          accumulator = function(accumulator!)
        }
        break
      case .binaryOperation(let function) :
        break
      case .equals:
        break
      }
    }
  }
  
  private struct PendingBinaryOperation {
    let function : (Double, Double) -> Double
    let firstOperand : Double
    
    func perform(with secondOperand:Double) -> Double {
      return function(firstOperand, secondOperand)
    }
  }
  
  mutating func setOperand(_ operand: Double) {
    accumulator = operand
  }
  
  var result : Double? {
    
    get {
      return accumulator
    }
    
  }
}
