//
//  410. Split Array Largest Sum.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 12.5.2024.
//

import Foundation

func splitArray(_ nums: [Int], _ k: Int) -> Int {
    var l = 1
    var r = nums.reduce(0, +)
    if r < l {
        return 0
    }
    
    func check(_ amount: Int) -> Bool {
        var count = 0
        var sum = 0
        for num in nums {
            if num > amount {
                return true
            }
            
            if num == amount && sum == 0 {
                count += 1
                continue
            }
            
            sum += num
            
            if sum >= amount {
                if num == amount {
                    count += 2
                    sum = 0
                } else {
                    count += 1
                    
                    if sum == amount {
                        sum = 0
                    } else {
                        sum = num
                    }
                }
            }
        }
        
        if sum < amount && sum != 0 {
            count += 1
        }
        
        return count > k
    }
    
    while l < r {
        let mid = (l + r) / 2
        if check(mid) {
            l = mid + 1
        } else {
            r = mid
        }
    }
    
    return l
}

//print(splitArray( [0], 1))
// [7,2,5,10,8], 2)
//[1, 4, 4], 3 == 4

// [7,2,5,10,8], 2 == 18

// [2,3,1,2,4,3], 5 == 4
