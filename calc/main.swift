//
//  main.swift
//  calc
//
//  Created by Matthew Clifford on 12/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() 
ValidateInput(args: args).checkValidity();


var result: (value: Int?, position: Int) = (0, 0)

if args.count == 1 {
    print(Int(args[0])!)
}

if args.count > 2 {
    while args.count > 2 {
        (result.value, result.position) = Calculator(args: args).calculate()
        args = RefreshArguments(args: args, resultValue: result.value, resultPosition: result.position).update()
    }
    print(result.value!)
}
