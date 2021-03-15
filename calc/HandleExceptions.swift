//
//  HandleExceptions.swift
//  calc
//
//  Created by Matthew Clifford on 13/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

struct HandleExceptions {

let errInput: String
   
   enum CalcError: Error {  //setting up error types
       case invalidInput
       case integerOverflow
       case divByZero
       case unknownOperator
       case incompleteExpression
   }
   
   // //functions for error handling
   func invalidInput() {
       do {
           throw CalcError.invalidInput
       } catch {
           print("Invalid number: \(errInput)")
           exit(1)
       }
   }
   
   func integerOverflow() {
       do {
           throw CalcError.integerOverflow
       } catch {
           print("Integer Overflow: \(errInput) > 9223372036854775807")
           exit(2)
       }
   }
   
   func divByZero() {
       do {
           throw CalcError.divByZero
       } catch {
           print("Division by zero")
           exit(3)
       }
   }
   
   func unknownOperator() {
       do {
           throw CalcError.unknownOperator
       } catch {
           print("Unknown operator: \(errInput)")
           exit(4)
       }
   }
   
   func incompleteExpression() {
       do {
           throw CalcError.incompleteExpression
       } catch {
           print("Incomplete expression. Expected input of the form [number] [operator number ...]")
           exit(5)
       }
   }
}

