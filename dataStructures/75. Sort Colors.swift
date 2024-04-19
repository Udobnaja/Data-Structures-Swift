//
//  75. Sort Colors.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 10.04.2024.
//

import Foundation

func sortColors(_ nums: inout [Int]) {
       for i in 0..<nums.count {
           var min_indx = i
           for j in i..<nums.count {
               if nums[j] < nums[min_indx] {
                   min_indx = j
               }
           }

           nums.swapAt(i, min_indx)
       }
}
//var g = [2,0,2,1,1,0]
//sortColors(&g)
//
//print(g)
