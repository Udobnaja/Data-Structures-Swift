func pairSum(_ head: ListNode?) -> Int {
    var fast = head?.next
    var slow = head
    if fast == nil || slow == nil {
        return 0
    }

    var length = 2

    while fast != nil && fast!.next != nil {
        slow = slow?.next
        fast = fast?.next?.next

        length += 2
    }

    var cur = slow?.next
    var prev: ListNode?

    while cur != nil {
        var dumpPrev = prev
        var next = cur?.next
        prev = cur
        prev?.next = dumpPrev

        cur = next
    }

    var maximum = 0
    var curRev = prev
    var curNotRev = head

    while curRev != nil {
        maximum = max(curNotRev!.val + curRev!.val, maximum)
        curRev = curRev!.next
        curNotRev = curNotRev!.next
    }

    return maximum
}

//print(pairSum(node1))
