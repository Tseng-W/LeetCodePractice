//: [Previous](@previous)

import Foundation

class Solution {
    func prisonAfterNDays(_ cells: [Int], _ n: Int) -> [Int] {
        guard cells.count > 2 else { return [Int](repeating: 0, count: cells.count) }
        var mutableCells = cells

        var cycleCount: Int?
        var remainDays: Int?
        var prisonDict = [String: Int]()

        for day in 0..<n {
            mutableCells = getNext(cells: mutableCells)
            if let cycleDay = prisonDict[mutableCells.description] {
                cycleCount = day - cycleDay
                remainDays = n - day - 1
                break
            }
            prisonDict[mutableCells.description] = day
        }

        if let cycleCount = cycleCount, let remainDays = remainDays {
            let remainder = remainDays % cycleCount
            for _ in 0..<remainder {
                mutableCells = getNext(cells: mutableCells)
            }
        }

        return mutableCells
    }

    private func getNext(cells: [Int]) -> [Int] {
        var result = [Int](repeating: -1, count: cells.count)
        for index in 0..<cells.count {
            guard index - 1 >= 0, index + 1 < cells.count else { result[index] = 0; continue }
            result[index] = cells[index - 1] == cells[index + 1] ? 1 : 0
        }
        return result
    }
}

Solution().prisonAfterNDays([1,0,0,1,0,0,1,0], 1000000000) == [0,0,1,1,1,1,1,0]
Solution().prisonAfterNDays([0,0,1,1,1,1,0,0], 8) == [0,0,0,1,1,0,0,0]
Solution().prisonAfterNDays([0,1,0,1,1,0,0,1], 7) == [0,0,1,1,0,0,0,0]

//: [Next](@next)
