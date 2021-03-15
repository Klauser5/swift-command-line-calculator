//
//  Calculator.swift
//  calc
//
//  Created by Matthew Clifford on 10/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

struct Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var int1: Int;
    var op: String;
    var int2: Int;
    var startingPos = 0;
    
    
    
    init(args: [String]) {        //initialise values to array positions, with 'if let' protection for unwrapping optionals
            
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
                findCalculationPair(args: args)         //find the right number, operator, number set if op is not priority operator
            }
        }
    
    func calculate() -> (value: Int?, position: Int) {     //outputs calculation for args from a single pair of numbers from the args array
           var result: Int                                    //returns calculation output and position of result
           
           if (op == "/" || op == "%") && int2 == 0 {    //checks for divide operator or modulus division by zero
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
               HandleExceptions(errInput: op).unknownOperator()   //unknown operator exception handler
           }
           ValidateInput(args: ["\(result)"]).isOutOfBounds()           //out of integer bounds exception handler
           return (result, startingPos)
       }
    
    
    mutating func findCalculationPair(args: [String]) {   //find the first pair of integers with a priority operator
          while startingPos < args.count-3 && !orderOfOperations() {
              startingPos += 2
              int1 = Int(args[startingPos])!
              op = args[startingPos+1]
              int2 = Int(args[startingPos+2])!
          }
          if startingPos == args.count-3 && !orderOfOperations() {  //use the first set in the array if none is found
              startingPos = 0
              int1 = Int(args[0])!    //firstInt and secondInt are previously unwrapped with 'if let' during initialisation
              op = args[1]
              int2 = Int(args[2])!
          }
      }
    
    func orderOfOperations() -> Bool {                           //order of precedence function for operators
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
