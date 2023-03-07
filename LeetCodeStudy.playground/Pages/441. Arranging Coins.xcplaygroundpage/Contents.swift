//: [Previous](@previous)

import Foundation

class Solution1 {
    func arrangeCoins(_ n: Int) -> Int {
        var count = 1
        var floor = 1
        while count + floor < n {
            floor += 1
            count += floor
        }

        return floor
    }
}

class Solution2 {
    func arrangeCoins(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var count = n
        for floor in 1...n {
            count -= floor
            if count < 0 { return floor - 1 }
        }

        fatalError()
    }
}

Solution2().arrangeCoins(5)
Solution2().arrangeCoins(6)
Solution2().arrangeCoins(8)
//: [Next](@next)
