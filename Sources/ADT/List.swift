
public class ListNode<Element: Hashable>: Equatable {
    public var prev: ListNode<Element>?
    public var next: ListNode<Element>?
    public let value: Element

    public init(value: Element, next: ListNode<Element>? = nil, prev: ListNode<Element>? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
    
    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs) && lhs.value == rhs.value
    }
}

public protocol LinkedList {
    associatedtype Element: Hashable

    var head: ListNode<Element>? { set get }
    var tail: ListNode<Element>? { set get }
    var count: Int { get }
    
    mutating func append(node: ListNode<Element>)
    mutating func insert(at index: Int, node: ListNode<Element>)
    mutating func removeLast() -> ListNode<Element>?
    mutating func remove(at index: Int) -> ListNode<Element>?
    func find(at index: Int) -> Element?
}

public struct DoublyLinkedList<T: Hashable>: LinkedList {
    public typealias Element = T
    public private(set) var count: Int = 0
    
    public var head: ListNode<Element>?
    public var tail: ListNode<Element>?
    
    public mutating func append(node: ListNode<Element>) {
        count += 1
        if head == nil {
            head = node
            tail = node
        } else {
            var h = head
            while h?.next != nil {
                h = h?.next
            }
            h?.next = node
            node.prev = h
            tail = node
        }
    }
    
    public mutating func insert(at index: Int, node: ListNode<Element>) {
        guard index < count else {
            append(node: node)
            return
        }
        
        if index == 0 {
            let h = head
            h?.prev = node
            node.next = h
            head = node
            return
        }
        
        if let n = _find(at: index) {
            let prev = n.prev
            prev?.next = node
            node.prev = prev
            node.next = n
            n.prev = node
            
            count += 1
        }
    }
    
    @discardableResult public mutating func removeLast() -> ListNode<T>? {
        if head == nil || tail == nil {
            return nil
        }
        if head == tail {
            let node = head
            head = nil
            tail = nil
            count -= 1
            return node
        } else {
            let secondLast = tail?.prev
            let node = tail
            secondLast?.next = nil
            tail = secondLast
            return node
        }
    }
    
    @discardableResult public mutating func remove(at index: Int) -> ListNode<T>? {
        guard index < count else {
            return removeLast()
        }
        
        if index == 0 {
            let h = head
            head = h?.next
            head?.prev = nil
            return h
        }
        
        var i = 0
        var h = head
        while h != nil {
            if i == index {
                let prev = h?.prev
                let next = h?.next
                prev?.next = next
                next?.prev = prev
                return h
            }
            
            h = h?.next
            i += 1
        }
        
        return nil
    }
    
    private func _find(at index: Int) -> ListNode<Element>? {
        guard index < count else { return nil }
        
        var i = 0
        var h = head
        while h != nil {
            if i == index {
                return h
            }
            h = h?.next
            i += 1
        }
        
        return nil
    }
    
    public func find(at index: Int) -> Element? {
        return _find(at: index)?.value
    }
    
    func debugPrint() {
        var node = head
        while node != nil {
            print(node?.value as Any)
            node = node?.next
        }
    }
}

