//: [Previous](@previous)

/// https://leetcode.com/problems/maximum-width-of-binary-tree/
///
/// Given the root of a binary tree, return the maximum width of the given tree.
///
/// The maximum width of a tree is the maximum width among all levels.
///
/// The width of one level is defined as the length between the end-nodes (the leftmost and rightmost non-null nodes), where the null nodes between the end-nodes that would be present in a complete binary tree extending down to that level are also counted into the length calculation.
///
/// It is guaranteed that the answer will in the range of a 32-bit signed integer.
///
///
///
/// Example 1:
///
///
/// Input: root = [1,3,2,5,3,null,9]
/// Output: 4
/// Explanation: The maximum width exists in the third level with length 4 (5,3,null,9).
/// Example 2:
///
///
/// Input: root = [1,3,2,5,null,null,9,6,null,7]
/// Output: 7
/// Explanation: The maximum width exists in the fourth level with length 7 (6,null,null,null,null,null,7).
/// Example 3:
///
///
/// Input: root = [1,3,2,5]
/// Output: 2
/// Explanation: The maximum width exists in the second level with length 2 (3,2).
///
///
/// Constraints:
///
/// The number of nodes in the tree is in the range [1, 3000].
/// -100 <= Node.val <= 100
///

//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue: [(node: TreeNode, index: Int)] = [(root, 0)]
        var maxLength = 0

        while queue.isEmpty == false {
            var count = queue.count
            var firstIndex = queue.first?.index ?? .max
            let lastIndex = queue.last?.index ?? .min
            maxLength = max(maxLength, lastIndex - firstIndex + 1)

            for _ in 0..<count {
                let (node, index) = queue.removeFirst()
                if let left = node.left { queue.append((left, index * 2)) }
                if let right = node.right { queue.append((right, index * 2 + 1)) }
            }
        }

        return maxLength
    }
}

// FIXME: Runtime Error on leetCode (process exited with signal SIGILL)
let array1 = [0,0,0,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil,nil,0,0,nil]
let array2 = [1,3,2,5,3,nil,9]

func arrayToNode(_ array: [Int?], _ i: Int) -> TreeNode? {
    guard i < array.count else { return nil }
    let nodeValue = array[i]
    if nodeValue == nil { return nil }
    let node = TreeNode(nodeValue!)
    node.left = arrayToNode(array, 2*i+1)
    node.right = arrayToNode(array, 2*i+2)
    return node
}

if let root = arrayToNode(array2, 0) {
    Solution().widthOfBinaryTree(root)
}

//: [Next](@next)
