//: [Previous](@previous)

/**
 Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.

 Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.

 The tests are generated such that there is exactly one solution. You may not use the same element twice.

 Your solution must use only constant extra space.



 Example 1:

 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
 Example 2:

 Input: numbers = [2,3,4], target = 6
 Output: [1,3]
 Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].
 Example 3:

 Input: numbers = [-1,0], target = -1
 Output: [1,2]
 Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].


 Constraints:

 2 <= numbers.length <= 3 * 104
 -1000 <= numbers[i] <= 1000
 numbers is sorted in non-decreasing order.
 -1000 <= target <= 1000
 The tests are generated such that there is exactly one solution.
 */

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var (left, right) = (0, numbers.count - 1)

        // 取得最接近 target / 2 的位置，由此開始向外尋找
        while right - left > 2 {
            var mid = right - left
            // 依照中位數的與 target 的關係，收攏 left 和 right，同時保持 left 和 right 的相對位置
            if numbers[mid] > target / 2 {
                right = max(mid - 1, left + 1)
            } else {
                left = min(mid + 1, right - 1)
            }
        }

        var currentSum: Int { numbers[left] + numbers[right] }

        while currentSum != target {
            // 當總和大於 target，代表過大 left 需要左移或 right 需要右移
            if currentSum > target {
                // left 先左移，不可小於 0
                left = max(0, left - 1)
                // Extra space (1): 記住當前 right 位置
                var originR = right
                // left 已左移，right 如果還是過大，right 持續左移總和過小
                while currentSum > target {
                    right = right - 1
                }
                // 若 left 當前位置至終仍找不到批配的 right，right 回到原位
                if currentSum != target { right = originR }
            } else {
                right = min(numbers.count - 1, right + 1)

                // 同上，因總和過小 right 已右移，在總和保持大於 target 的情況下 left 持續右移尋找
                var originL = left
                while currentSum < target {
                    left = left + 1
                }
                // 找不到匹配對象，left 回到原位
                if currentSum != target { left = originL }
            }
        }

        // 要求輸出結果 + 1 (1...numbers.count)
        return [left + 1, right + 1]
    }
}

Solution().twoSum([2,7,11,15], 9)

//: [Next](@next)
