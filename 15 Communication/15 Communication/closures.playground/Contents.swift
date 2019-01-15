import UIKit

class LogicClass {
    
    func add(_ lhs: Int, _ rhs: Int, positive: () -> Void, negative: (() -> Void)?) {
        if lhs > 0 && rhs > 0 {
            positive()
        } else {
            negative?()
        }
    }
    
}

class MainClass {
    
    let logic = LogicClass()
    
    var first = 0
    var second = 0
    
    func check(success: () -> Void, failure: (() -> Void)? = nil) {
        logic.add(first, second, positive: success, negative: failure)
    }
}


let main = MainClass()
main.check(success: {
    print("positive")
})






func chain(first: () -> Void, second: () -> Void, third: () -> Void) {
    // Do initial stuff
    first()
    
    print("Hej hej")
    first()
    
    second()
    
    // Do final stuff
    third()
}

chain(first: {
    print("first")
}, second: {
    print("second")
}) {
    print("third")
}


func request(success: () -> Void, failure: () -> Void) {
    // Gör massa saker
    success()
    failure()
}

request(success: {
    print("YES")
}, failure: {
    print("NO")
})



func doActualCount(value1: Int, value2: Int, callback: (Int) -> Void) {
    callback(value1 + value2)
}

func doCount(value1: Int, value2: Int, callback: (Int) -> Void) {
    doActualCount(value1: value1, value2: value2, callback: callback)
}

doCount(value1: 1, value2: 2) { (result) -> Void in
    print(result)
}


func test(completion: () -> Void) {
    for i in 0...100000 {
        i
    }
    print("Test Done")
    completion()
}

test {
    print("Closure")
}


let numbers = [2, 3, 1, 98, 43, 56]

numbers.sorted()

numbers.sorted(by: >)

numbers.sorted { (a, b) -> Bool in
    return a > b
}
