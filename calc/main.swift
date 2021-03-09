//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Retrieve User Input
let no1 = args[0]; // Sample Code Only! Update Required!
let op = args[1]; // Sample Code Only! Update Required!
let no2 = args[2]; // Sample Code Only! Update Required!

let num1: Int = Int(no1) ?? 0
let num2: Int = Int(no2) ?? 0

// Initialize a Calculator object
let calculator = Calculator();

var result = 0;

switch op {
case "+":
    result = calculator.add(no1: num1, no2: num2);
case "-":
    result = calculator.subtract(no1: num1, no2: num2);
case "*":
    result = calculator.multiply(no1: num1, no2: num2);
case "/":
    result = calculator.divide(no1: num1, no2: num2);
case "%":
    result = calculator.modulo(no1: num1, no2: num2);
default:
    result = -9999
}
// Calculate the result





print("The args are \(args).")

if (result == -9999)
{
    print("invalid operator")
}
else
{
    print(result)

}

