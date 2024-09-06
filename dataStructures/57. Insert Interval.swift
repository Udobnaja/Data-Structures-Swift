//
//  57. Insert Interval.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 27.8.2024.
//

import Foundation

func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    var ans = [[Int]]()
    var found = false
    ans.append(newInterval)
    for interval in intervals {
        let last = ans[ans.count - 1]
        if newInterval[0] <= interval[1] && (newInterval[1] >= interval[1] || newInterval[1] >= interval[0]) {
            ans[ans.count - 1] = [min(last[0], interval[0]), max(last[1], interval[1])]
            
        } else {
            ans.append(interval)
            if interval[1] < last[1] {
                ans.swapAt(ans.count - 1, ans.count - 2)
            }
        }
    }
    
    return ans
}

//print(insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]))
//print(insert([[1,3],[6,9]], [2,5]))
//print(insert([], [5,7]))
//print(insert([[1, 5]], [0,0]))


//print(insert([[3,5],[12,15]], [6,6]))
