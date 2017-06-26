
public protocol QueueType {
    associatedtype Element: Hashable
    
    mutating func enqueue(value: Element, priority: Int)
    mutating func dequeue() -> Element?
}

public struct Queue<T: Hashable>: QueueType {
    public typealias Element = T
    
    private var list: DoublyLinkedList<Element> = DoublyLinkedList<Element>()
    
    public mutating func enqueue(value: Element, priority: Int = 0) {
        let node = ListNode<Element>(value: value)
        list.append(node: node)
    }
    
    public mutating func dequeue() -> Element? {
        return list.remove(at: 0)?.value
    }
}
