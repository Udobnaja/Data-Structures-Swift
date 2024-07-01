//
//  967. Numbers With Same Consecutive Differences.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 1.7.2024.
//

import Foundation

func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {
    var result = [Int]()
    var sett = Set<String>()
    
    func b(_ str: String, _ l: Int){
        guard str.count != n else {
            if !sett.contains(str) {
                sett.insert(str)
                result.append(Int(str)!)
            }
            
            return
        }
        
        let s = l + k
        
        
        if s < 10 {
            b(str + "\(s)", s)
        }
        
        let d = l - k
        
        if d >= 0 {
            b(str + "\(d)", d)
        }
    }
    
    for i in 1...9 {
        b("\(i)", i)
    }
    
    
    return result
}

//print(numsSameConsecDiff(2, 0).count)

