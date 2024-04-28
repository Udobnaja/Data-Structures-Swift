//
//  1710. Maximum Units on a Truck.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 28.4.2024.
//

import Foundation

func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
    var result = 0
    var truckSize = truckSize
    for boxType in boxTypes.sorted(by: { $0[1] > $1[1] }) {
        if truckSize - boxType[0] >= 0 {
            result += boxType[1] * boxType[0]
            truckSize -= boxType[0]
        } else {
            result += truckSize * boxType[1]
            return result
        }
    }
    return result
}

//print(maximumUnits([[5,10],[2,5],[4,7],[3,9]], 10))
