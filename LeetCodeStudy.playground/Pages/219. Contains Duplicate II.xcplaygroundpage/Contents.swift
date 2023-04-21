//: [Previous](@previous)

import Foundation

/**
 219. Contains Duplicate II
 Easy
 4.7K
 2.6K
 Companies
 Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.



 Example 1:

 Input: nums = [1,2,3,1], k = 3
 Output: true
 Example 2:

 Input: nums = [1,0,1,1], k = 1
 Output: true
 Example 3:

 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false


 Constraints:

 1 <= nums.length <= 10^5
 -10^9 <= nums[i] <= 10^9
 0 <= k <= 10^5
 */

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int: Int]()
        for (index, num) in nums.enumerated() {
            if let last = dict[num], index - last <= k {
                return true
            }
            dict[num] = index
        }
        return false
    }
}

//: [Next](@next)
