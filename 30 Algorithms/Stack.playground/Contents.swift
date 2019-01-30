import UIKit

// LIFO - Last in, first out

struct Stack<T> {
    
    private var array = [T]()
    
    var isEmpty: Bool { return array.isEmpty }
    var count: Int { return array.count }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
}

var stack = Stack<Int>()

stack.push(10)
stack.push(15)
stack.push(5)

stack.pop()
stack.pop()
