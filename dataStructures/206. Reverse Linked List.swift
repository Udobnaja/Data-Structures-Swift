import Foundation

func reverse(head: ListNode?) -> ListNode? {
    var cur = head
    var prev: ListNode?

    while cur != nil {
        let tempPrev = prev
        let next = cur?.next
        prev = cur
        prev?.next = tempPrev
        cur = next
    }

    return prev
}

//let reverseF = reverse(head: node1)
