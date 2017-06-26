
public struct BinarySearchTree<KeyType: Comparable, ValueType: Hashable>: SymbolTable {
    public typealias Key = KeyType
    public typealias Element = ValueType
    
    private var root: TreeNode<KeyType, ValueType>?
    
    public private(set) var count: Int = 0
    
    public func getValue(by key: KeyType) -> ValueType? {
        var r = root
        while r != nil {
            if key < r!.key {
                r = r?.left
            } else if key > r!.key {
                r = r?.right
            } else {
                return r?.value
            }
        }
        return nil
    }
    
    public mutating func setValue(for key: KeyType, value: ValueType) {
        let newNode = TreeNode<KeyType, ValueType>(key: key, value: value)
        if root == nil {
            root = newNode
            return
        }
        
        var r = root
        while r != nil {
            if key < r!.key {
                if let left = r?.left {
                    r = left
                } else {
                    r?.left = newNode
                    break
                }
            } else if key > r!.key {
                if let right = r?.right {
                    r = right
                } else {
                    r?.right = newNode
                    break
                }
            } else {
                r = newNode
                break
            }
        }
    }
    
    public func getKeys() -> [KeyType] {
        var keys = [KeyType]()
        travel(node: root) { (node) in
            if let n = node {
                keys.append(n.key)
            }
        }
        return keys
    }
    
    public func getValues() -> [ValueType] {
        var values = [ValueType]()
        travel(node: root) { (node) in
            if let n = node {
                values.append(n.value)
            }
        }
        return values
    }
    
    private func travel(node: TreeNode<KeyType, ValueType>?, action: (TreeNode<KeyType, ValueType>?) -> Void) {
        if node == nil { return }
        
        travel(node: node?.left, action: action)
        action(node)
        travel(node: node?.right, action: action)
    }
    
    func debugPrint() {
        travel(node: root) { (node) in
            print(node?.key as Any)
        }
    }
}
