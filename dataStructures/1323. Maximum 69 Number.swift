//
//  1323. Maximum 69 Number.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 27.04.2024.
//

import Foundation

func maximum69Number(_ num: Int) -> Int {
    var arr = Array("\(num)")
    guard let index = arr.firstIndex(of: "6") else { return num }
    arr[index] = "9"
    return Int(String(arr))!
}
//print(maximum69Number(6966))
