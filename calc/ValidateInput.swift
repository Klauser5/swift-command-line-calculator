//
//  validateInput.swift
//  calc
//
//  Created by Matthew Clifford on 9/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

struct ValidateInput {
    
    let args: [String];
    let index = 0;
    
    func checkValidity() {
        if (args.count % 2 == 0) {                                      //checks for invalid argument count
                 HandleExceptions(errInput: "").incompleteExpression()
             }
             if (args.count == 1 && Int(args[0]) == nil)  {                  //checks for non-numerical single character inputs
                 HandleExceptions(errInput: args[index]).invalidInput()
             }
             for index in stride(from: 0, to: args.count-2, by: 2) {         //checks for non-integers and/or nil args in array positions that require numbers
                 if Int(args[index]) == nil {
                     HandleExceptions(errInput: args[index]).invalidInput()
                 }
             }
             isOutOfBounds()
    }
    
    
    func isOutOfBounds() {                                              //initial argument validation
            for index in stride(from: 0, to: args.count, by: 1) {           //check if calculation result is out of bounds
                if let integerSize = Int(args[index]) {
                    if integerSize > Int32.max || integerSize < Int32.min {
                        HandleExceptions(errInput: (args.joined(separator: " "))).integerOverflow()
                    }
                }
            }
    }
    
 }
