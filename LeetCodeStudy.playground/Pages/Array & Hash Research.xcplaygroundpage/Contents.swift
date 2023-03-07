//: [Previous](@previous)

import Foundation

// hash

var greeting = "Hello, playground"

// First time: -6991885630801721304
// Another time: 7366418189511455615
var hasher = Hasher()
hasher.combine(greeting)
hasher.finalize()


var primes: Set = [2, 3, 5, 7]
primes.count
primes.insert(2)
primes.count

// Array

example("Copy array used") {
    var array: [Int] = [1, 2, 3]
    var newArray = array
    return array.address == newArray.address
}


example("Copy array and append") {
    var array: [Int] = [1, 2, 3]
    var newArray = array
    newArray.append(4)
    return array.address == newArray.address
}

example("Assign new element") {
    var array: [Int] = [1, 2, 3]
    let originalAddress = array.address
    array[0] = -1
    return originalAddress == array.address
}

example("PopLast element") {
    var array: [Int] = [1, 2, 3]
    let originalAddress = array.address
    array.popLast()
    return originalAddress == array.address
}

example("Append element") {
    var array: [Int] = [1, 2, 3]
    let originalAddress = array.address
    array.append(99)
    return originalAddress == array.address
}

example("PopLast and append element") {
    var array: [Int] = [1, 2, 3]
    let originalAddress = array.address
    array.popLast()
    originalAddress == array.address

    array.append(99)
    return originalAddress == array.address
}
//: [Next](@next)
