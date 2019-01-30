import UIKit

var array = [5, 4, 6, 1, 5, 3, 5]

extension Array where Element: Equatable {
    
    func firstIndexOf(_ element: Element) -> Int? {
        for (i, n) in self.enumerated() {
            if n == element {
                return i
            }
        }
        return nil
    }
    
    func lastIndexOf(_ element: Element) -> Int? {
        for (i, n) in self.enumerated().reversed() {
            if n == element {
                return i
            }
        }
        return nil
    }
    
    func indexes(for element: Element) -> [Int]? {
        return self.enumerated().compactMap({
            return $0.element == element ? $0.offset : nil
        })
    }
    
}

array.firstIndexOf(6)
array.lastIndexOf(4)
array.indexes(for: 5)
