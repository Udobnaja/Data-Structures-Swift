//
//  2575. Find the Divisibility Array of a String  .swift
//  dataStructures
//
//  Created by Anna Udobnaja on 28.8.2024.
//

import Foundation

func divisibilityArray(_ word: String, _ m: Int) -> [Int] {
    var word = Array(word)
    var div = [Int]()
    var cur = 0

    for i in 0..<word.count {
        cur = (cur * 10 + Int(String(word[i]))!) % m
        div.append(cur == 0 ? 1 : 0)
    }

    return div
}

//print(divisibilityArray("998244353", 3))
