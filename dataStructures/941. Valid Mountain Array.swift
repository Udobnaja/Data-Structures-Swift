//
//  941. Valid Mountain Array.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 21.03.2024.
//

import Foundation

func validMountainArray(_ arr: [Int]) -> Bool {
    guard arr.count >= 3 else { return false }
    for i in 0..<arr.count {
        if i == 0, arr[i] > arr[i + 1] { return false }

        guard i > 0 else { continue }

        if i == arr.count - 1, arr[i] > arr[i - 1] { return false }
        if arr[i - 1] == arr[i] { return false }

        guard i < arr.count - 1 else { continue }

        if arr[i - 1] > arr[i] && arr[i + 1] > arr[i]  { return false }
    }

    return true
}

//print(validMountainArray([3,7,6,4,3,0,1,0]))
