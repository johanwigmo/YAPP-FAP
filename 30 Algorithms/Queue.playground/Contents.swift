import UIKit

struct Queue<T> {
    
    private var array = [T?]()
    private var head = 0
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        if head > 2 {
            let temp = array.dropFirst(head)
            array = Array(temp)
            head = 0
        }
        
        return element
    }
}


var queue = Queue<Int>()

queue.enqueue(10)
queue.enqueue(15)
queue.enqueue(5)

queue.dequeue()
queue.dequeue()
