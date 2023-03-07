//: [Previous](@previous)

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = ""

        for char in s {
            if let last = stack.last,
               isPair(lhs: last, rhs: char) {
                stack.popLast()
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }

    private func isPair(lhs: Character, rhs: Character) -> Bool {
        return [("(", ")"), ("{", "}"), ("[", "]")]
            .contains(where: { $0 == (lhs, rhs)})
    }
}

Solution().isValid("()") == true
Solution().isValid("()[]{}") == true
Solution().isValid("(]") == false
Solution().isValid("(){}}{") == false

//: [Next](@next)
