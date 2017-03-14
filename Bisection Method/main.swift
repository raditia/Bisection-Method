//
//  main.swift
//  Bisection Method
//
//  Created by Raditia Madya on 3/9/17.
//  Copyright © 2017 Universitas Gadjah Mada. All rights reserved.
//

import Foundation

//function for user to give input
func input() -> String {
    let keyboard = FileHandle.standardInput
    let inputData = keyboard.availableData
    return NSString(data: inputData, encoding: String.Encoding.utf8.rawValue) as! String
}

//function to calculate polynomial equation
func polynomial(coordinate: Double, c3: Double, c2: Double, c1: Double, c0: Double) -> Double {
    let c3Result = c3 * pow(coordinate, 3)
    let c2Result = c2 * pow(coordinate, 2)
    let c1Result = c1 * coordinate
    let functionValue = c3Result + c2Result + c1Result + c0
    
    return functionValue
}

//user gives input to the equation and the endpoints
print("Enter coefficients (c3,c2,c1,c0) of polynomial: ")
var c3 = input()
var c2 = input()
var c1 = input()
var c0 = input()

print("Enter endpoints a and b: ")
var a = input()
var b = input()

//convert string input into double
let c3Value = (c3 as NSString).doubleValue
let c2Value = (c2 as NSString).doubleValue
let c1Value = (c1 as NSString).doubleValue
let c0Value = (c0 as NSString).doubleValue

var a_value = (a as NSString).doubleValue
var b_value = (b as NSString).doubleValue

//making F(a) and F(b) function
var fa = polynomial(coordinate: a_value, c3: c3Value, c2: c2Value, c1: c1Value, c0: c0Value)
var fb = polynomial(coordinate: b_value, c3: c3Value, c2: c2Value, c1: c1Value, c0: c0Value)

print("\na\t\t\tb\t\tc\t\t\tf(a)\t\tf(b)\tf(c)\t\t(b-a)")

//bisection method
while Swift.abs(a_value - b_value) > 0.0001 {
    var c = 0.5 * (a_value + b_value)
    var fc = polynomial(coordinate: c, c3: c3Value, c2: c2Value, c1: c1Value, c0: c0Value)
    
    if (fa * fc) < 0 {
        b_value = c
        fb = fc
    }
    else {
        a_value = c
        fa = fc
    }
    
    print(String(format: "%.6f, %.6f, %.6f, %.6f, %.6f, %.6f, %.6f", a_value, b_value, c, fa, fb, fc, (b_value - a_value)))
}

var root = 0.5 * (a_value + b_value)
var rootFunction = polynomial(coordinate: root, c3: c3Value, c2: c2Value, c1: c1Value, c0: c0Value)

print("\nroot: \(0.5 * (a_value + b_value))")
//print("root: \(rootFunction)")
