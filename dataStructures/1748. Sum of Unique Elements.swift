//
//  1748. Sum of Unique Elements.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 14.8.2024.
//

import Foundation

//func sumOfUnique(_ nums: [Int]) -> Int {
//    var dic = [Int: Int]()
//    for num in nums {
//        dic[num, default: 0] += 1
//    }
//    var sum = 0
//
//    for (key, value) in dic {
//        if value == 1 {
//            sum += key
//        }
//    }
//
//    return sum
//}

func sumOfUnique(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    var double = Set<Int>()
    
    for num in nums {
        if set.contains(num) {
            double.insert(num)
        } else {
            set.insert(num)
        }
    }
    
    set.subtract(double)
    
    return set.reduce(0, +)
}

//print(sumOfUnique([1,2,3,2]))
