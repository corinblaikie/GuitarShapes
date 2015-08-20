import Foundation

extension Array {
    
    func randomItem() -> T {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    
    func first(fn: (T) -> Bool) -> T? {
        for x in self {
            let t = x as T
            if fn(t) {
                return t
            }
        }
        return nil
    }
    
    func first(fn: (T, Int) -> Bool) -> T? {
        var i = 0
        for x in self {
            let t = x as T
            if fn(t, i++) {
                return t
            }
        }
        return nil
    }
    
    func indexOf<T : Equatable>(value: T) -> Int? {
        
        for (index, element) in enumerate(self) {
            if (element as! T == value) {
                return index
            }
        }
        
        return nil
    }
    

    func take(var elementCount: Int) -> Array {
        if (elementCount > count) {
            elementCount = count
        }
        return Array(self[0..<elementCount])
    }
    
    
    func shuffled() -> [T] {
        var list = self
        for i in 0..<(list.count - 1) {
            let j = Int(arc4random_uniform(UInt32(list.count - i))) + i
            swap(&list[i], &list[j])
        }
        return list
    }
}