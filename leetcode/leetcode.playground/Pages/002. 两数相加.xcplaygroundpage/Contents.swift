/// https://leetcode-cn.com/problems/add-two-numbers/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var listNode1 = l1
        var listNode2 = l2
        
        var carry: Int = 0
        let result: ListNode = ListNode(0)
        var currentNode: ListNode = result
        
        while listNode1 != nil || listNode2 != nil || carry > 0 {
            let sum: Int = (listNode1?.val ?? 0) + (listNode2?.val ?? 0) + carry
            listNode1 = listNode1?.next
            listNode2 = listNode2?.next
            
            carry = sum / 10
            currentNode.next = ListNode(sum % 10)
            currentNode = currentNode.next!
        }
        
        return result.next
    }
}

var l1: ListNode = ListNode(1)
var listNodeTemp = l1
listNodeTemp.next = ListNode(4)
listNodeTemp = listNodeTemp.next!
listNodeTemp.next = ListNode(8)
listNodeTemp = listNodeTemp.next!

var l2: ListNode = ListNode(3)
var listNodeTemp2 = l2
listNodeTemp2.next = ListNode(4)
listNodeTemp2 = listNodeTemp2.next!
listNodeTemp2.next = ListNode(8)
listNodeTemp2 = listNodeTemp2.next!

print(l1)
print(l2)

var result: ListNode? = Solution().addTwoNumbers(l1, l2)
var currentNode: ListNode? = result
while currentNode != nil {
    print(currentNode!.val)
    currentNode = currentNode?.next
}
