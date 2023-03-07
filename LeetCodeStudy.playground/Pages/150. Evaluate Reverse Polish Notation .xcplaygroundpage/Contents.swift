//: [Previous](@previous)

class Solution {
    enum Operator: String {
        case add = "+", sub = "-", multi = "*", divide = "/"

        func operate(lhs: Int, rhs: Int) -> Int {
            switch self {
            case .add: return lhs + rhs
            case .sub: return lhs - rhs
            case .multi: return lhs * rhs
            case .divide: return lhs / rhs
            }
        }
    }

    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()

        for token in tokens {
            if let operation = Operator(rawValue: token) {
                guard let rhs = stack.popLast(), let lhs = stack.popLast()
                else { fatalError("Unexpected operation without value.") }
                let new = operation.operate(lhs: lhs, rhs: rhs)
                stack.append(new)
            } else if let num = Int(token) {
                stack.append(num)
            } else {
                fatalError("Unexpected input.")
            }
        }
        guard let last = stack.popLast(),
              stack.isEmpty else {
            fatalError()
        }
        return last
    }
}

Solution().evalRPN(["2","1","+","3","*"]) == 9
Solution().evalRPN(["4","13","5","/","+"]) == 6
Solution().evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]) == 22

//: [Next](@next)
