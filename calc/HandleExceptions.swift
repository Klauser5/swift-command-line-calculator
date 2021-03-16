//
//  HandleExceptions.swift
//  calc
//
//  Created by Matthew Clifford on 13/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

/**
 Throws an error if necessary

 - Parameter errInput: The number being added

 - Throws: `CalcError.'error type'`
           if `errInput` is incorrect.

 - Returns: An explanation of the error and the number in question
 */
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
   
    /**
     Throws an error

     - Parameter errInput: The number being added

     - Throws: `CalcError.invalidInput`
               if `errInput` is incorrect.

     - Returns: An explanation of the error and the number in question
     */
   func invalidInput() {
       do {
           throw CalcError.invalidInput
       } catch {
           print("Invalid number: \(errInput)")
           exit(1)
       }
   }
   
    /**
     Throws an error

     - Parameter errInput: The number being added

     - Throws: `CalcError.integerOverflow`
               if `errInput` is incorrect.

     - Returns: An explanation of the error and the number in question
     */
   func integerOverflow() {
       do {
           throw CalcError.integerOverflow
       } catch {
           print("Integer Overflow: \(errInput) > 9223372036854775807")
           exit(2)
       }
   }
   

 /**
  Throws an error

  - Parameter errInput: The number being added

  - Throws: `CalcError.divByZero`
            if `errInput` is incorrect.

  - Returns: An explanation of the error and the number i
 */
   func divByZero() {
       do {
           throw CalcError.divByZero
       } catch {
           print("Division by zero")
           exit(3)
       }
   }
   
    /**
     Throws an error

     - Parameter errInput: The number being added

     - Throws: `CalcError.unknownOperator`
               if `errInput` is incorrect.

     - Returns: An explanation of the error and the number i
    */
   func unknownOperator() {
       do {
           throw CalcError.unknownOperator
       } catch {
           print("Unknown operator: \(errInput)")
           exit(4)
       }
   }
   
    /**
     Throws an error

     - Parameter errInput: The number being added

     - Throws: `CalcError.incompleteExpression`
               if `errInput` is incorrect.

     - Returns: An explanation of the error and the number i
    */
   func incompleteExpression() {
       do {
           throw CalcError.incompleteExpression
       } catch {
           print("Incomplete expression. Expected input of the form [number] [operator number ...]")
           exit(5)
       }
   }
}

