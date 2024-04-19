//
//  Prints.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 19.04.2024.
//

import Foundation

func printForNodeList(_ node: ListNode?) {
    var head: ListNode? = node

    while head != nil {
        print(head?.val ?? "nothing")
        head = head?.next
    }
}

func printBFS(_ root: TreeNode) {
    var q = [root]

    while !q.isEmpty {
        let curLevelLength = q.count
        var nextQueue = [TreeNode]()

        for i in 0..<curLevelLength {
            let node = q[i]

            if let left = node.left {
                nextQueue.append(left)
            }


            if let right = node.right {
                nextQueue.append(right)
            }
        }

        q = nextQueue
    }
}
