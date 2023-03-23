//: [Previous](@previous)

/**
 https://leetcode.com/problems/3sum/
 15. 3Sum

 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.



 Example 1:

 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 Example 2:

 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.
 Example 3:

 Input: nums = [0,0,0]
 Output: [[0,0,0]]
 Explanation: The only possible triplet sums up to 0.


 Constraints:

 3 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        // Sort array 以套用 two point
        let sortedNums = nums.sorted()
        var result = [[Int]]()

        // 假設 i 存在於結果中，試找出剩餘的兩個數字並總和為 0
        for i in 0..<sortedNums.count - 2 {
            // 如果與上一個數字相同代表會有相同的結果，為避免重複應跳過
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }

            // 從 i + 1 ~ count - 1 找出批配的兩個數字
            var left = i + 1
            var right = sortedNums.count - 1

            // Two point
            while left < right {
                let sum = sortedNums[i] + sortedNums[left] + sortedNums[right]
                if sum == 0 {
                    // 儲存組合後繼續找其他可能組合
                    result.append([sortedNums[i], sortedNums[left], sortedNums[right]])

                    // 避免 left 找到重複數字
                    while left < right && sortedNums[left] == sortedNums[left + 1] {
                        left += 1
                    }

                    // 避免 right 找到重複數字
                    while left < right && sortedNums[right] == sortedNums[right - 1] {
                        right -= 1
                    }

                    left += 1
                    right -= 1
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return result
    }
}

print(Solution().threeSum([-1,0,1,2,-1,-4]))

//: [Next](@next)
