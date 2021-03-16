//
//  Calculator.swift
//  calc
//
//  Created by Matthew Clifford on 10/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

/**
 Throws an error if necessary

 - Parameter int1: The first number being processed
 - Parameter op: The operator of the equation
 - Parameter int2: The second number being processed
 - Parameter startingPos: Starts at 0



 - Returns: The result of the equation
 */
struct Calculator {
    

    var int1: Int;
    var op: String;
    var int2: Int;
    var startingPos = 0;
    
    
    
    init(args: [String]) {
            if let unwrappedFirstInt = Int(args[startingPos]) {
                int1 = unwrappedFirstInt
            } else {
                HandleExceptions(errInput: args.joined(separator: " ")).invalidInput()
                exit(1)
            }
            op = args[startingPos+1]
            if let unwrappedSecondInt = Int(args[startingPos+2]) {
                int2 = unwrappedSecondInt
            } else {
                HandleExceptions(errInput: args.joined(separator: " ")).invalidInput()
                exit(1)
            }
            if !orderOfOperations() {
                findCalculationPair(args: args)
            }
        }
    
    

    func calculate() -> (value: Int?, position: Int) {     
           var result: Int
           
           if (op == "/" || op == "%") && int2 == 0 {
               HandleExceptions(errInput: "").divByZero()
           }
           
           switch op {
           case "+":
               result = int1 + int2
           case "-":
               result = int1 - int2
           case "x":
               result = int1 * int2
           case "/":
               result = int1 / int2
           case "%":
               result = int1 % int2
           default:
               result = 0
               HandleExceptions(errInput: op).unknownOperator()
           }
           ValidateInput(args: ["\(result)"]).outOfBounds()
           return (result, startingPos)
       }
    
    
    mutating func findCalculationPair(args: [String]) {
          while startingPos < args.count-3 && !orderOfOperations() {
              startingPos += 2
              int1 = Int(args[startingPos])!
              op = args[startingPos+1]
              int2 = Int(args[startingPos+2])!
          }
          if startingPos == args.count-3 && !orderOfOperations() {
              startingPos = 0
              int1 = Int(args[0])!
              op = args[1]
              int2 = Int(args[2])!
          }
      }
    
    func orderOfOperations() -> Bool {                           
            switch op {
            case "+", "-":
                return false
            case "x", "/", "%":
                return true
            default:
                return false
            }
}
}
