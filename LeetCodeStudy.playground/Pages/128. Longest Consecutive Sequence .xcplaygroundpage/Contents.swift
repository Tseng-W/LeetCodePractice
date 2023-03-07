//: [Previous](@previous)

import Foundation

class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var hashSet: Set<Int> = .init(nums)
        var longestConsecutive = 0

        // O(n)
        for num in nums where hashSet.contains(num - 1) == false {
            var currentConsecutive = 1

            while hashSet.contains(num + currentConsecutive) {
                currentConsecutive += 1
            }

            longestConsecutive = max(longestConsecutive, currentConsecutive)
        }

        return longestConsecutive
    }
}


// O(n^3)
//class Solution {
//    func longestConsecutive(_ nums: [Int]) -> Int {
//        guard nums.count > 0 else { return 0 }
//
//        var longestConsecutive: Int = .min
//
//        var dict: [Int: Int] = [:]
//
//        // O(n)
//        for num in nums where dict[num] == nil {
//            let upperConsecutive = dict[num + 1, default: 0]
//            let lowerConsecutive = dict[num - 1, default: 0]
//
//            let newConsecutive = upperConsecutive + lowerConsecutive + 1
//            if newConsecutive > longestConsecutive {
//                longestConsecutive = newConsecutive
//            }
//
//
//            var offset = 1
//            // O(n)
//            while dict[num + offset] != nil {
//                dict[num + offset] = newConsecutive
//                offset += 1
//            }
//            offset = 1
//
//            // O(n)
//            while dict[num - offset] != nil {
//                dict[num - offset] = newConsecutive
//                offset += 1
//            }
//
//            dict[num] = newConsecutive
//        }
//
//        return longestConsecutive
//    }
//}

Solution().longestConsecutive([100,4,200,1,3,2]) == 4
Solution().longestConsecutive([0,3,7,2,5,8,4,6,0,1]) == 9

//: [Next](@next)
