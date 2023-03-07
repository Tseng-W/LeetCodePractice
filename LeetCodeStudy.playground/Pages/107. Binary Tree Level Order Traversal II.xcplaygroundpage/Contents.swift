//: [Previous](@previous)

import Foundation

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result: [[Int]] = []
        var queue: [TreeNode] = [root]
        var temp = [Int]()

        while queue.isEmpty == false {
            var levelCount = queue.count

            while levelCount > 0 {
                let node = queue.removeFirst()
                temp.append(node.val)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }

                levelCount -= 1
            }

            if temp.isEmpty == false { result.append(temp) }
            temp.removeAll()
        }

        return result.reversed()
    }
}

//: [Next](@next)
