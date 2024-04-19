import Foundation

func middleNode(_ head: ListNode?) -> ListNode? {
    var fast = head
    var slow = head

    while fast != nil && fast?.next != nil {
        guard let fNext = fast?.next else {
            return slow?.next?.next
        }
        slow = slow?.next
        fast = fNext.next
    }

    return slow
}
