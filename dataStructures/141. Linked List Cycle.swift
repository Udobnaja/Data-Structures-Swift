import Foundation

func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = head
    var hasCycle = false

    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next

        if fast === slow {
            hasCycle = true
            break
        }
    }

    return hasCycle
}
