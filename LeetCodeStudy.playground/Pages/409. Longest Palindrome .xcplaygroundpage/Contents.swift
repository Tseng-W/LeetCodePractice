//: [Previous](@previous)

import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var hasMiddle: Bool = false
        var totalPairs: Int = 0
        var dict: [Character: Int] = [:]

        // O(n)
        for char in s {
            dict[char, default: 0] += 1
        }

        // O(n)
        for (_, value) in dict {
            totalPairs += value / 2

            if value % 2 != 0, hasMiddle == false {
                hasMiddle = true
            }
        }

        var middleCount: Int {
            hasMiddle ? 1 : 0
        }
        return totalPairs * 2 + middleCount
    }
}

Solution().longestPalindrome("abccccdd") == 7
Solution().longestPalindrome("aaaa") == 4
Solution().longestPalindrome("aaa") == 3
Solution().longestPalindrome("bb") == 2
Solution().longestPalindrome("a") == 1

//: [Next](@next)
