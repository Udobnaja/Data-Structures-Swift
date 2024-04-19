//
//  11. Minimum Depth of Binary Tree.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 23.02.2024.
//

import Foundation


func minDepth(_ root: TreeNode?) -> Int {
    guard let root else { return 0 }
    let left = minDepth(root.left)
    let right = minDepth(root.right)
    return (left != 0 && right != 0 ? min(left, right) : max(left, right)) + 1
}

//print(minDepth(root))
