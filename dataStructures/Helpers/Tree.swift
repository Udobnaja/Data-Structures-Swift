//
//  Tree.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 19.04.2024.
//

import Foundation

func createTree(from array: [Int?]) -> TreeNode? {
    guard !array.isEmpty, let firstVal = array.first as? Int else {
        return nil
    }

    let root = TreeNode(firstVal)
    var queue: [TreeNode?] = [root]

    var index = 1
    while index < array.count && !queue.isEmpty {
        let node = queue.removeFirst()

        if index < array.count, let leftVal = array[index] {
            node?.left = TreeNode(leftVal)
            queue.append(node?.left)
        }
        index += 1

        if index < array.count, let rightVal = array[index] {
            node?.right = TreeNode(rightVal)
            queue.append(node?.right)
        }
        index += 1
    }

    return root
}
