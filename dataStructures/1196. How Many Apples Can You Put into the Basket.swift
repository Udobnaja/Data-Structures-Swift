//
//  1196. How Many Apples Can You Put into the Basket.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 29.4.2024.
//

import Foundation

func maxNumberOfApples(_ weight: [Int]) -> Int {
    var sum = 0
    var counter = 0
    
    for item in weight.sorted() {
        guard sum + item <= 5000 else { return counter }
        
        sum += item
        counter += 1
    }
    
    return counter
}

//print(maxNumberOfApples([900,950,800,1000,700,800]))
