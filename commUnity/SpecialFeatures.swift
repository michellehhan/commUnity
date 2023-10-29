//
//  SpecialFeatures.swift
//  commUnity
//
//  Created by Michelle Han on 10/28/23.
//

import Foundation
import JavaScriptCore

func executeJavaScript() {
    let context = JSContext()
    
    // This JavaScript code declares a function that calculates the sum of two numbers and logs it.
    let javaScriptCode = """
    function calculateSum(a, b) {
        return a + b;
    }
    console.log(calculateSum(5, 3));
    """
    
    context?.evaluateScript(javaScriptCode)
}

func executeJavaScript2() {
    let context = JSContext()
    
    // This JavaScript code declares a function that calculates the sum of two numbers and logs it.
    let javaScriptCode = """
    function calculateSum(a, b) {
        return a + b;
    }
    console.log(calculateSum(5, 3));
    """
    
    context?.evaluateScript(javaScriptCode)
}

func executeJavaScript3() {
    let context = JSContext()
    
    // This JavaScript code declares a function that calculates the sum of two numbers and logs it.
    let javaScriptCode = """
    function calculateSum(a, b) {
        return a + b;
    }
    console.log(calculateSum(5, 3));
    """
    
    context?.evaluateScript(javaScriptCode)
}


