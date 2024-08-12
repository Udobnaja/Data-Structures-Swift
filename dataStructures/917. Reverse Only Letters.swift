//
//  917. Reverse Only Letters.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 12.8.2024.
//

import Foundation

func reverseOnlyLetters(_ s: String) -> String {
    var origString = Array(s)
    var left = 0
    var right = origString.count - 1
    
    while left < right {
        let lSymbol = origString[left]
        let rSymbol = origString[right]
        
        if lSymbol.isLetter && rSymbol.isLetter {
            origString[left] = rSymbol
            origString[right] = lSymbol
            left += 1
            right -= 1
        } else if !lSymbol.isLetter {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return String(origString)
}

//print(reverseOnlyLetters("ab-cd"))
