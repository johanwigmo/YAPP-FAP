import UIKit

class Node {
    let value: Int
    let left: Node?
    let right: Node?
    
    init(value: Int, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

extension Node {
    
    func sumAllNodes() -> Int {
        // May not compile
        // Heavy on memory
        return (left?.sumAllNodes() ?? 0) + (right?.sumAllNodes() ?? 0) + value
    }

    func total() -> Int {
        var value = 0
        var stack = [self]
        var index = 0

        while index < stack.count {
            let node = stack[index]

            if let left = node.left {
                stack.append(left)
            }
            if let right = node.right {
                stack.append(right)
            }

            value += node.value
            index += 1
        }

        return value
    }

}


var node = Node(value: 5, left: Node(value: 5, left: Node(value: 5, right: Node(value: 5))), right: Node(value: 5))
node.total()

extension Node {
    
    class func generate() -> Node {
        let left: Node? = Bool.random() ? generate() : nil
        let right: Node? = Bool.random() ? generate() : nil
        return Node(value: Int.random(in: 0...100), left: left, right: right)
    }
    
}

let generated = Node.generate()
generated.total()
generated.sumAllNodes()

