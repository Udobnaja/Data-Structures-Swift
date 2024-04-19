func swapPairs(_ head: ListNode?) -> ListNode? {
    guard let head, let dymmy = head.next else {
        return head
    }

    var prev: ListNode?
    var pair: ListNode? = head

    while pair != nil && pair!.next != nil {
        if prev != nil {
            prev!.next = pair!.next
        }

        prev = pair

        var nextNode = pair!.next!.next

        pair!.next!.next = pair

        pair!.next = nextNode
        pair = nextNode
    }

    return dymmy



//    if head == nil { return nil }
//    let leftNode = head?.next
//    let rightNode = head
//    rightNode?.next = swapPairs(head?.next?.next)
//    leftNode?.next = rightNode
//
//    return leftNode
}

//printForNodeList(swapPairs(node1))
