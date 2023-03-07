//: [Previous](@previous)

import Foundation

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var productArray: [Int] = .init(repeating: 0, count: nums.count)

        var leftMuti = 1
        for leftIndex in 1 ..< productArray.count {
            leftMuti *= nums[leftIndex - 1]
            productArray[leftIndex] = leftMuti
        }

//        var rightMuti = 1
//        for rightIndex in (0 ..< productArray.count - 1).reversed() {
//            rightMuti *= nums[rightIndex + 1]
//            productArray[rightIndex] *= rightMuti * nums[rightIndex + 1]
//        }

        return productArray
    }
}

let a = Solution().productExceptSelf([1,2,3,4])
a == [24,12,8,6]

let b = Solution().productExceptSelf([-1,1,0,-3,3])
b == [0,0,9,0,0]

//: [Next](@next)
