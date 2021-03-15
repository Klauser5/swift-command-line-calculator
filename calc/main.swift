//
//  main.swift
//  calc
//
//  Created by Matthew Clifford on 12/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program
ValidateInput(args: args).checkValidity();


var result: (value: Int?, position: Int) = (0, 0)

if args.count == 1 {                                //handle single arguments where optional unwrap has been checked with 'if let' during validate process
    print(Int(args[0])!)
}

if args.count > 2 {                                 //process calculation passes for valid arguments until result is achieved
    while args.count > 2 {
        (result.value, result.position) = Calculator(args: args).calculate()
        args = RefreshArguments(args: args, resultValue: result.value, resultPosition: result.position).update()
    }
    print(result.value!)
}
