//
//  56. Merge Intervals.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 27.8.2024.
//

import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    var ans = [[Int]]()
    
    let intervals = intervals.sorted(by: { $0[0] < $1[0] })
    ans.append(intervals[0])
    
    for i in 1..<intervals.count {
        if ans[ans.count - 1][1] >= intervals[i][0] {
            ans[ans.count - 1][1] = max(ans[ans.count - 1][1], intervals[i][1])
        } else {
            ans.append(intervals[i])
        }
       
    }
    
    return ans
}

//print(merge([[1,3],[2,6],[8,10],[15,18]]))
