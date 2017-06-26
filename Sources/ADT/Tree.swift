
public class TreeNode<Key: Comparable, Element: Hashable>: Equatable {
    public var left: TreeNode<Key, Element>?
    public var right: TreeNode<Key, Element>?
    public let key: Key
    public let value: Element
    
    public init(key: Key, value: Element, left: TreeNode<Key, Element>? = nil, right: TreeNode<Key, Element>? = nil) {
        self.key = key
        self.value = value
        self.left = left
        self.right = right
    }
    
    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs) && lhs.value == rhs.value
    }
}
