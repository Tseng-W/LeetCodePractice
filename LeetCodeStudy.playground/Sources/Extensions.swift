import Foundation

public extension Array {
    var address: String {
        withUnsafeBufferPointer { buffer in
            return String(reflecting: buffer.baseAddress)
        }
    }
}

public func example(_ name: String, testAction: () -> Bool) {
    print(name)
    print("Result: ", testAction())
    print("")
}
