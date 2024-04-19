//
//  100. Same Tree.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 22.02.2024.
//

import Foundation

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if (p != nil && q == nil) || (q != nil && p == nil) {
       return false
    }

    guard let p, let q else {
        return true
    }

    if p.val != q.val {
        return false
    }

    return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
}


//print(isSameTree(root, root))
