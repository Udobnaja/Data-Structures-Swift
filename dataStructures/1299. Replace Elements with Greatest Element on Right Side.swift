//
//  1299. Replace Elements with Greatest Element on Right Side.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 22.03.2024.
//

import Foundation

func replaceElements(_ arr: [Int]) -> [Int] {
    var m = -1
    var i = arr.count - 1
    var arr = arr
    while i >= 0 {
        var temp = arr[i]
        arr[i] = m
        m = max(m, temp)
        i -= 1
    }

    return arr
}

//print(replaceElements([400]))
