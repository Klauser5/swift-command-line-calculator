//
//  validateInput.swift
//  calc
//
//  Created by Matthew Clifford on 9/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

class ValidateInput {
    
    
    
    /**
     Checks to see if the arguments consist only of allowed characters

     - Parameter recipient: The command line arguments

     - Throws: TBA

     - Returns: A boolean value indicating if the arguments fit the requirements or not.
     */
    func validateChars(args: [String]) -> Bool {
        var result = true;
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
