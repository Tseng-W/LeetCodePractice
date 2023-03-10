//: [Previous](@previous)

import Foundation
/**
 227. Basic Calculator II (https://leetcode.com/problems/basic-calculator-ii/description/)
 Given a string `s` which represents an expression, *evaluate this expression and return its value*.
 The integer division should truncate toward zero.
 You may assume that the given expression is always valid. All intermediate results will be in the range of `[-231, 231 - 1]`.
 **Note:** You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as `eval()`.

**Example 1:**
```
Input: s = "3+2*2"
Output: 7
```

**Example 2:**
```
Input: s = " 3/2 "
Output: 1
```

**Example 3:**
```
Input: s = " 3+5 / 2 "
Output: 5
```

**Constraints:**
- `1 <= s.length <= 3 * 105`
- `s` consists of integers and operators `('+', '-', '*', '/')` separated by some number of spaces.
- `s` represents **a valid expression**.
- All the integers in the expression are non-negative integers in the range `[0, 231 - 1]`.
- The answer is **guaranteed** to fit in a **32-bit integer**.
*/


class Solution {
    enum Operator: Character {
        case add = "+", sub = "-", multi = "*", divide = "/"
        var operate: (Int, Int) -> Int {
            switch self {
            case .add: return (+)
            case .divide: return (/)
            case .multi: return (*)
            case .sub: return (-)
            }
        }
    }
    func calculate(_ s: String) -> Int {
        var numsStack = [Int]()
        var operatorStack = [Operator]()
        var tempNums = [Character]()

        var waitingOp: Operator?

        // Loop through the string character by character and ignore whitespace
        for char in s where char != " " {
            if let op = Operator(rawValue: char) {
                // If current character is an operator,
                // it means the previous number is now complete and ready to be converted
                let num = Int(String(tempNums))!
                tempNums.removeAll()

                // If there is a waiting operator which requires operands multiplication or division,
                // perform the operation immediately, otherwise just save the number
                if let waitingOp = waitingOp {
                    numsStack.append(waitingOp.operate(numsStack.popLast()!, num))
                } else {
                    numsStack.append(num)
                }

                // Reset waiting operator and store the current operator in the operator stack
                waitingOp = nil
                switch op {
                case .add, .sub: operatorStack.append(op)
                case .multi, .divide: waitingOp = op
                }
            } else {
                // Add current character to a temporary array
                // which will form a number to be converted later
                tempNums.append(char)
            }
        }

        // Handle the last number in the string
        if tempNums.isEmpty == false { numsStack.append(Int(String(tempNums))!) }

        // Process the waiting operator if there is one
        if let waitingOp = waitingOp {
            let rhs = numsStack.popLast()!
            let lhs = numsStack.popLast()!
            numsStack.append(waitingOp.operate(lhs, rhs))
        }
        print(numsStack)

        // Process the remaining operators in the operator stack
        var result = numsStack[0]
        for index in 0..<operatorStack.count {
            result = operatorStack[index].operate(result, numsStack[index + 1])
        }
        return result
    }
}

Solution().calculate("1-1+1")

//: [Next](@next)
