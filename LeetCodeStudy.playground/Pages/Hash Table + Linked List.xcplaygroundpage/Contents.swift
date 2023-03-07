//: [Previous](@previous)

import Foundation

class HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = LinkedList<Element>

    private var buckets: [Bucket]
    private(set) var count = 0

    init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeating: LinkedList<Element>(), count: capacity)
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

    func contains(key: Key) -> Bool {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return true
            }
        }
        return false
    }

    @discardableResult
    func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        if var existingElement = buckets[index].first(where: { $0.key == key }) {
            let oldValue = existingElement.value
            existingElement.value = value
            return oldValue
        } else {
            buckets[index].append(Element(key: key, value: value))
            count += 1

            // Check if the hash table needs to be resized
            if Double(count) / Double(buckets.count) > 0.7 {
                resize()
            }
            return nil
        }
    }

    @discardableResult
    func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        if let index = buckets[index].firstIndex(where: { $0.key == key }) {
            let oldValue = buckets[index].remove(at: index)?.value
            count -= 1
            return oldValue
        }
        return nil
    }

    private func resize() {
        let newCapacity = buckets.count * 2
        var newBuckets = Array<Bucket>(repeating: LinkedList<Element>(), count: newCapacity)

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

// LinkedList 結構
fileprivate class LinkedList<Element> {
    fileprivate class Node<Element> {
        var value: Element
        var next: Node?

        init(value: Element, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }

    private var head: Node<Element>?
    private var tail: Node<Element>?

    var isEmpty: Bool {
        return head == nil
    }

    var first: Node<Element>? {
        return head
    }

    var last: Node<Element>? {
        return tail
    }

    func append(_ value: Element) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    func node(at index: Int) -> Node<Element>? {
        guard index >= 0 else { return nil }

        if index == 0 {
            return head
        } else {
            var currentNode = head?.next
            var currentIndex = 1
            while currentNode != nil && currentIndex < index {
                currentNode = currentNode?.next
                currentIndex += 1
            }
            return currentNode
        }
    }

    @inlinable public func firstIndex(where predicate: (Element) -> Bool) -> Int? {
        var index = 0
        var currentNode = head
        while let node = currentNode {
            if predicate(node.value) {
                return index
            } else {
                currentNode = node.next
            }
            index += 1
        }
        return nil
    }

    @inlinable public func remove(at position: Int) -> Element? {
        guard let previousNode = node(at: position - 1),
              let targetNode = previousNode.next else { return nil }
        previousNode.next = targetNode.next
        return targetNode.value
    }

    struct LinkedListIterator<T>: IteratorProtocol {
        private var current: LinkedList<T>.Node<T>?

        fileprivate init(_ list: LinkedList<T>) {
            current = list.head
        }

        public mutating func next() -> T? {
            defer { current = current?.next }
            return current?.value
        }
    }
}

extension LinkedList: Sequence {
    public func makeIterator() -> LinkedListIterator<Element> {
        return LinkedListIterator<Element>(self)
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
