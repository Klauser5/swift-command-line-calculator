//
//  validateInput.swift
//  calc
//
//  Created by Matthew Clifford on 9/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation


/**
 Throws an error

 - Parameter args: The arguments entered to the program

 - Throws: `HandleExceptions.CalcError.invalidInput`
 `HandleExceptions.CalcError.incompleteExpression`
 `HandleExceptions.CalcError.invalidInput`
           if `errInput` is incorrect.

 - Returns: An error if the arguments are invalid.
 */
struct ValidateInput {
    
    let args: [String];
    let index = 0;
    
    func checkValidity() {
        if (args.count % 2 == 0) {
                 HandleExceptions(errInput: "").incompleteExpression()
             }
             if (args.count == 1 && Int(args[0]) == nil)  {
                 HandleExceptions(errInput: args[index]).invalidInput()
             }
             for index in stride(from: 0, to: args.count-2, by: 2) {
                 if Int(args[index]) == nil {
                     HandleExceptions(errInput: args[index]).invalidInput()
                 }
             }
             outOfBounds()
    }
    
    
    func outOfBounds() {                                             
            for index in stride(from: 0, to: args.count, by: 1) {
                if let integerSize = Int(args[index]) {
                    if integerSize > Int32.max || integerSize < Int32.min {
                        HandleExceptions(errInput: (args.joined(separator: " "))).integerOverflow()
                    }
                }
            }
    }
    
 }
