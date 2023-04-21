//: [Previous](@previous)

/**
 395. Longest Substring with At Least K Repeating Characters
 Medium
 5.3K
 426
 Companies
 Given a string s and an integer k, return the length of the longest substring of s such that the frequency of each character in this substring is greater than or equal to k.



 Example 1:

 Input: s = "aaabb", k = 3
 Output: 3
 Explanation: The longest substring is "aaa", as 'a' is repeated 3 times.
 Example 2:

 Input: s = "ababbc", k = 2
 Output: 5
 Explanation: The longest substring is "ababb", as 'a' is repeated 2 times and 'b' is repeated 3 times.


 Constraints:

 1 <= s.length <= 10^4
 s consists of only lowercase English letters.
 1 <= k <= 10^5
 **/

class Solution {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        let n = s.count
        guard k <= n else { return 0 }
        var map = [Character: Int]()
        for c in s {
            map[c, default: 0] += 1
        }

        var separator: Character?
        for (key, value) in map where value < k {
            separator = key
            break
        }

        guard let separator else { return n }

        var result = 0
        let substrings = s.split(separator: separator)
        for substring in substrings {
            result = max(result, longestSubstring(String(substring), k))
        }
        return result
    }
}

Solution().longestSubstring("aaabb", 3)

//: [Next](@next)
