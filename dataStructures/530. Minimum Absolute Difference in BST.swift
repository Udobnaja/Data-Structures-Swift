//
//  530. Minimum Absolute Difference in BST.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 28.02.2024.
//

import Foundation

//func getMinimumDifference(_ root: TreeNode?) -> Int {
//    var values = [Int]()
//    func dfs(_ root: TreeNode?) {
//        guard let root else { return }
//
//        dfs(root.left)
//        values.append(root.val)
//        dfs(root.right)
//    }
//
//    dfs(root)
//    var minimum = Int.max
//
//    for i in 1..<values.count {
//        minimum = min(minimum, abs(values[i] - values[i - 1]))
//
//        if minimum == 1 {
//            break
//        }
//    }
//
//    return minimum
//}

func getMinimumDifference(_ root: TreeNode?) -> Int {
    var minimum = Int.max
    var prev: TreeNode?
    func dfs(_ root: TreeNode?) {
        guard let root else { return }
        guard minimum > 1 else { return }

        dfs(root.left)
        if let prev {
            minimum = min(minimum, abs(root.val - prev.val))
        }
        prev = root
        dfs(root.right)
    }

    dfs(root)

    return minimum
}

//print(getMinimumDifference(root))


