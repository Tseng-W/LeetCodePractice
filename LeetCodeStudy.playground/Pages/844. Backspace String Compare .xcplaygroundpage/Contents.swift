//: [Previous](@previous)

import Foundation

class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        return calculateBackspace(s: s) == calculateBackspace(s: t)
    }

    private func calculateBackspace(s: String) -> String {
        var stack = ""
        for char in s {
            if char == "#" {
                stack.popLast()
            } else {
                stack.append(char)
            }
        }
        return stack
    }
}

Solution().backspaceCompare("ab#c", "ad#c") == true
Solution().backspaceCompare("ab#c", "ad#c") == true
Solution().backspaceCompare("a#c", "b") == false


//: [Next](@next)
