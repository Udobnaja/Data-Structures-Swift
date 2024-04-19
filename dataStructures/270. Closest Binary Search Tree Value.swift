//
//  270. Closest Binary Search Tree Value.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 03.03.2024.
//

import Foundation

//func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
//    func customRound(_ number: Double) -> Double {
//        let fraction = number - Double(Int(number))
//        if fraction <= 0.5 {
//            return floor(number)
//        } else {
//            return ceil(number)
//        }
//    }
//    func dfs(_ root: TreeNode?, _ target: Int, prev: Int) -> Int {
//        guard let root else { return prev }
//
//        let newPrev = abs(root.val - target) < abs(prev - target) ? root.val : prev
//
//        let left = dfs(root.left, target, prev: newPrev)
//        let right = dfs(root.right, target, prev: newPrev)
//
//        if abs(left - target) < abs(right - target) {
//            return left
//        } else {
//            return right
//        }
//    }
//
//    return dfs(root, Int(customRound(target)), prev: Int.max)
//}

func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
    var ans = Int.max
    var diff = Double(Int.max)
    func dfs(_ root: TreeNode?, _ target: Double) {
        guard let root else { return }
        let curDiff = abs(Double(root.val) - target)
        if curDiff < diff {
            diff = curDiff
            ans = root.val
        } else if curDiff == diff {
            ans = min(ans, root.val)
        }
        if target < Double(root.val) {
            dfs(root.left, target)
        } else {
            dfs(root.right, target)
        }
    }

    dfs(root, target)

    return ans
}

//print(closestValue(bst, 3.5))

