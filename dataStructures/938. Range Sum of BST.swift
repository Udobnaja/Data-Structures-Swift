//
//  938. Range Sum of BST.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 28.02.2024.
//

import Foundation


func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
    guard let root else { return 0 }

    let inRange = !(root.val <= low || root.val >= high)

    var s = !(root.val < low || root.val > high) ? root.val : 0

    if inRange {
        s += rangeSumBST(root.left, low, high) + rangeSumBST(root.right, low, high)
    } else if root.val <= low {
        s += rangeSumBST(root.right, low, high)
    } else if root.val >= high {
        s += rangeSumBST(root.left, low, high)
    }

    return s
}

//print(rangeSumBST(root, 6, 10))
