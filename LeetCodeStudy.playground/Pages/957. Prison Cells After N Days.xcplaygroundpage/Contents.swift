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

class Solution_New {
    func prisonAfterNDays(_ cells: [Int], _ n: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        var day = 0
        var k8 = (0..<8).reduce(0) {
            return $0 | (cells[$1] << $1)
        }

        while dict[k8] == nil {
            if day == n { break }
            dict[k8] = day
            day += 1
            k8 = ~((k8 << 1)^(k8 >> 1)) & 0b1111110
        }

        if day != n, let start = dict[k8] {
            let cycle = day - start
            for _ in 0..<(n - day) % cycle {
                k8 = ~((k8 << 1)^(k8 >> 1)) & 0b1111110
            }
        }

        return (0..<8).map({ k8 >> $0 & 1 })
    }
}

Solution_New().prisonAfterNDays([1, 0, 1, 0, 0, 1, 0, 1], 100000)

var cell: UInt8 = 0b00100101
var nextDay = ~((cell << 1)^(cell >> 1)) & 0b1111110
String(cell, radix: 2)
String((cell << 1), radix: 2).leftPadding(8)
String((cell >> 1), radix: 2).leftPadding(8)
String(nextDay, radix: 2).leftPadding(8)

extension String {
    func leftPadding(_ length: Int) -> String {
        let padding = length - count
        guard padding > 0 else { return self }
        String(repeating: "0", count: padding)
        return String(repeating: "0", count: padding) + self
    }
}
//: [Next](@next)
