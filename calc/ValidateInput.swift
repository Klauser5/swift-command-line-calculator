//
//  validateInput.swift
//  calc
//
//  Created by Matthew Clifford on 9/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

class ValidateInput {
    
    var result = true;
    
    //Checks for invalid characters
    //Only 1-9 and + - * / % allowed
    func validateChars(args: [String]) -> Bool {
        for arg in args {
            
            switch arg {
            case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "+", "-", "*", "/", "%":
                result = true;
            default:
            result = false;
                return result;
            }
            
            
        }
        return result;
    }
    
 }
