//
//  3005. Count Elements With Maximum Frequency.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 15.8.2024.
//

import Foundation

//func maxFrequencyElements(_ nums: [Int]) -> Int {
//    var dic = [Int: Int]()
//    var mx = 0
//    for num in nums {
//        dic[num, default: 0] += 1
//        mx = max(mx, dic[num]!)
//    }
//    var sum = 0
//    for v in dic.values {
//        if v == mx {
//            sum += mx
//        }
//    }
//
//    return sum
//}


func maxFrequencyElements(_ nums: [Int]) -> Int {
    var dic = [Int: Int]()
    var mx = 0
    for num in nums {
        dic[num, default: 0] += 1
        mx = max(mx, dic[num]!)
    }
    
    return dic.filter { $0.value == mx }.count * mx
}

//print(maxFrequencyElements([1,2,2,3,1,4]))

