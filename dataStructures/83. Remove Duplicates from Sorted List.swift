import Foundation

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    var prev = head
    var next = head?.next

    while next != nil {
        if prev?.val == next?.val {
            next = next?.next
            prev?.next = next
        } else {
            prev = next
            next = next?.next
        }
    }

    return head
}
