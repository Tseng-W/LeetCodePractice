//: [Previous](@previous)

/**
 https://leetcode.com/problems/island-perimeter/
 You are given row x col grid representing a map where grid[i][j] = 1 represents land and grid[i][j] = 0 represents water.

 Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells).

 The island doesn't have "lakes", meaning the water inside isn't connected to the water around the island. One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.



 Example 1:


 Input: grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
 Output: 16
 Explanation: The perimeter is the 16 yellow stripes in the image above.
 Example 2:

 Input: grid = [[1]]
 Output: 4
 Example 3:

 Input: grid = [[1,0]]
 Output: 4


 Constraints:

 row == grid.length
 col == grid[i].length
 1 <= row, col <= 100
 grid[i][j] is 0 or 1.
 There is exactly one island in grid.
 */
import Foundation

class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var edgeCount = 0

        for row in 0..<grid.count {
            for col in 0..<grid[row].count where grid[row][col] == 1 {
                if row - 1 < 0 || grid[row - 1][col] == 0 {
                    edgeCount += 1
                }
                if row + 1 >= grid.count || grid[row + 1][col] == 0 {
                    edgeCount += 1
                }
                if col - 1 < 0 || grid[row][col - 1] == 0 {
                    edgeCount += 1
                }
                if col + 1 >= grid[row].count || grid[row][col + 1] == 0 {
                    edgeCount += 1
                }
            }
        }
        return edgeCount
    }
}

class Solution2 {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var islandCount = 0
        var neighborCount = 0

        for row in 0..<grid.count {
            for col in 0..<grid[row].count where grid[row][col] == 1 {
                islandCount += 1
                if row + 1 < grid.count && grid[row + 1][col] == 1 {
                    neighborCount += 1
                }
                if col + 1 < grid[row].count && grid[row][col + 1] == 1 {
                    neighborCount += 1
                }
            }
        }
        return islandCount * 4 - neighborCount * 2
    }
}

Solution().islandPerimeter([[1, 1]]) == 6

//: [Next](@next)
