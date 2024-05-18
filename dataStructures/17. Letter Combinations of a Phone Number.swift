//
//  17. Letter Combinations of a Phone Number.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 18.5.2024.
//

import Foundation

func letterCombinations(_ digits: String) -> [String] {
    var ans = [String]()
    
    let digits = Array(digits)
    
    let extr: [Character: [String]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]
    
    func backtrace(_ cur: [String], _ index: Int) {
        guard cur.count != digits.count else {
            guard !cur.isEmpty else { return }
            ans.append(cur.joined())
            return
        }
        
        var cur = cur
        
        for letter in extr[digits[index]]! {
            cur.append(letter)
            backtrace(cur, index + 1)
            cur.removeLast()
        }
    }
    
    backtrace([], 0)
    
    return ans
}

//print(letterCombinations(""))
