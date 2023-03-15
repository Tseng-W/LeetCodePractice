//: [Previous](@previous)

/**
 https://leetcode.com/problems/ugly-number-ii/
 An ugly number is a positive integer whose prime factors are limited to 2, 3, and 5.

 Given an integer n, return the nth ugly number.

 Example 1:

 Input: n = 10
 Output: 12
 Explanation: [1, 2, 3, 4, 5, 6, 8, 9, 10, 12] is the sequence of the first 10 ugly numbers.
 Example 2:

 Input: n = 1
 Output: 1
 Explanation: 1 has no prime factors, therefore all of its prime factors are limited to 2, 3, and 5.


 Constraints:

 1 <= n <= 1690
 */

import Foundation

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 1 else { return 1 }

        let primes = [2, 3, 5]
        var points = [Int](repeating: 0, count: primes.count)

        // dynamic programing: Save all multi results.
        var dp = [Int](repeating: 0, count: n)
        dp[0] = 1

        for current in 1..<n {
            // Calculate all possible multi results.
            let multiResults = (0..<primes.count)
                .map({ dp[points[$0]] * primes[$0] })

            // Save the min one.
            dp[current] = multiResults.min().unsafelyUnwrapped

            // Point should move forward if different primes get the same result.
            multiResults
                .enumerated()
                .filter({ $0.element == dp[current] })
                .forEach({ points[$0.offset] += 1 })
        }

        return dp[n - 1]
    }
}

Solution().nthUglyNumber(10)

//: [Next](@next)
