func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    var pointer = head
    var dummy = head
    var index = 1
    var prevPointer = pointer

    while index < left {
        prevPointer = pointer // 1 >
        pointer = pointer?.next // 2 >
        index += 1
    }

    var nextPointer = prevPointer?.next

    var reverse: ListNode?
    var cur = pointer
    while index <= right {
        let curNext = cur?.next
        let dumpR = reverse

        reverse = cur
        reverse?.next = dumpR

        cur = curNext

        index += 1
    }

    if left == 1 {
        prevPointer?.next = cur
        return reverse
    } else {
        prevPointer?.next = reverse
        nextPointer?.next = cur
    }


    return dummy
}

//printForNodeList(reverseBetween(node1, 1, 2))

