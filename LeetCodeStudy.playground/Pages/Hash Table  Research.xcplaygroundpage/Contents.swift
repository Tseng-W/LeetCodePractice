//: [Previous](@previous)

import Foundation

struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]

    private var buckets: [Bucket]
    private(set) var count = 0

    init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }

    private func index(forKey key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }

    subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }

    func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }

    mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)

        // Check if the key already exists in the hash table
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }

        // The key does not exist in the hash table, insert a new element
        buckets[index].append((key: key, value: value))
        count += 1

        // Check if the hash table needs to be resized
        if Double(count) / Double(buckets.count) > 0.7 {
            resize()
        }

        return nil
    }

    mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)

        // Check if the key exists in the hash table
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil
    }

    private mutating func resize() {
        let newCapacity = buckets.count * 2
        var newBuckets = Array<Bucket>(repeating: [], count: newCapacity)

        // Move all the elements from the old buckets to the new buckets
        for bucket in buckets {
            for element in bucket {
                let index = abs(element.key.hashValue) % newCapacity
                newBuckets[index].append(element)
            }
        }

        buckets = newBuckets
    }
}

var hashTable = HashTable<String, Int>(capacity: 5)
hashTable["one"] = 1
hashTable["two"] = 2
hashTable["three"] = 3

print(hashTable["one"]) // Output: Optional(1)
print(hashTable["four"]) // Output: nil

hashTable["two"] = 22
print(hashTable["two"]) // Output: Optional(22)

hashTable["three"] = nil
print(hashTable["three"]) // Output: nil

//: [Next](@next)
