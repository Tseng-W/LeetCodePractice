//: [Previous](@previous)

/**
 https://leetcode.com/problems/hamming-distance/
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

 Given two integers x and y, return the Hamming distance between them.



 Example 1:

 Input: x = 1, y = 4
 Output: 2
 Explanation:
 1   (0 0 0 1)
 4   (0 1 0 0)
 ↑   ↑
 The above arrows point to positions where the corresponding bits are different.
 Example 2:

 Input: x = 3, y = 1
 Output: 1


 Constraints:

 0 <= x, y <= 231 - 1
 */

import Foundation

class Solution1 {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        return String(x ^ y, radix: 2).filter({ $0 == "1" }).count
    }
}

class Solution2 {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var xor = x ^ y
        var count = 0
        while xor > 0 {
            xor &= xor - 1
            count += 1
        }

        return count
    }
}

Solution2().hammingDistance(0, 1) == 1

//: [Next](@next)
