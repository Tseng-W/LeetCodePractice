//: [Previous](@previous)

import Foundation
import XCTest

// 383. Ransom Note - https://leetcode.com/problems/ransom-note/

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var ransomDict: [Character: Int] = stringToDictCount(string: ransomNote) // O(n)
        var magaDict: [Character: Int] = stringToDictCount(string: magazine) // O(n)

        for (char, count) in ransomDict where magaDict[char, default: 0] < count {
            return false
        }

        return true
    }

    private func stringToDictCount(string: String) -> [Character: Int] {
        var dict: [Character: Int] = [:]
        for char in string {
            dict[char, default: 0] += 1
        }
        return dict
    }
}

Solution().canConstruct("a", "b") == false
Solution().canConstruct("aa", "ba") == false
Solution().canConstruct("aa", "aab") == true

//: [Next](@next)
