//
//  ListNode.swift
//  dataStructures
//
//  Created by Anna Udobnaja on 19.04.2024.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
