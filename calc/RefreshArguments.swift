//
//  RefreshArguments.swift
//  calc
//
//  Created by Matthew Clifford on 13/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

/**
 Throws an error if necessary

 - Parameter args: The arguments entered into the 

 - Throws: `CalcError.'error type'`
           if `errInput` is incorrect.

 - Returns: An explanation of the error and the number in question
 */
struct RefreshArguments {
    
    let args: [String]
    let resultValue: Int?
    let resultPosition: Int
    
    func update() -> [String] {                                                     
        
        if resultPosition == 0 && args.count == 3 {
            return  ["\(resultValue!)"]
            
        } else if resultPosition == 0 && args.count > 1 && args.count > 3 {
            return ["\(resultValue!)"]  + Array(args[resultPosition + 3...args.count - 1])
            
        } else if resultPosition > 0 && resultPosition < args.count-3  {
            return Array(args[0...resultPosition - 1]) + ["\(resultValue!)"] + Array(args[resultPosition + 3...args.count - 1])
            
        } else  {
            return Array(args[0...resultPosition - 1]) + ["\(resultValue!)"]
            
        }
    }
}
