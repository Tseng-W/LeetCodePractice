//: [Previous](@previous)

/**
 Given a string s, find the length of the longest
 substring
 without repeating characters.



 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.


 Constraints:

 0 <= s.length <= 5 * 10^4
 s consists of English letters, digits, symbols and spaces.
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var max = 0
        var start = 0
        var end = 0
        var map = [Character: Int]()
        for c in s {
            if let index = map[c] {
                if index >= start {
                    start = index + 1
                }
            }
            map[c] = end
            end += 1
            if max < end - start {
                max = end - start
            }
        }
        return max
    }
}
//: [Next](@next)
