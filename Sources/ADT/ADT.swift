
extension Array {
    mutating func exchange(left: Int, right: Int) {
        let temp = self[left]
        self[left] = self[right]
        self[right] = temp
    }
}
