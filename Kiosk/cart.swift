struct CartItem {
    var menuName : String
    var quantity : Int
    var menuCost : Int
    var unitCost: Int
}

class Cart {
    var cartItems: [CartItem] = []
    var cartItemDictionary: [String: Int] = [:]
    var orderStatus: OrderStatus
    
    init() {
        self.orderStatus = .empty
    }
    
    func addItemToCart(menuName: String, quantity: Int, unitCost: Int, orderStatus: OrderStatus) {
        self.orderStatus = .inProgress
        if let index = cartItemDictionary[menuName] {
            let updatedQuantity = cartItems[index].quantity + quantity
            let updatedCost = cartItems[index].menuCost + unitCost * quantity
            cartItems[index] = CartItem(menuName: menuName, quantity: updatedQuantity, menuCost: updatedCost, unitCost: unitCost)
        } else {
            let newItem = CartItem(menuName: menuName, quantity: quantity, menuCost: unitCost * quantity, unitCost: unitCost)
            cartItems.append(newItem)
            cartItemDictionary[menuName] = cartItems.count - 1
        }
    }
    
    func removeItemByNumber(number: Int, quantity: Int) {
        if number >= 1 && number <= cartItems.count {
            cartItems[number - 1].quantity -= quantity
            cartItems[number - 1].menuCost -= cartItems[number - 1].unitCost * quantity
            if cartItems[number - 1].quantity <= 0 {
                let removedItem = cartItems.remove(at: number - 1)
                cartItemDictionary.removeValue(forKey: removedItem.menuName)
                for i in number - 1..<cartItems.count {
                    cartItemDictionary[cartItems[i].menuName] = i
                }
            }
        } else {
            print("잘못된 번호입니다.")
        }
    }
    
    func printCartItems() {
        print("------------------------------------------")
        print("장바구니:")
        for (index, item) in cartItems.enumerated() {
            print("\(index + 1). \(item.menuName) - 수량 : \(item.quantity) 가격 : \(item.menuCost)")
        }
        print("------------------------------------------")
        print("총 가격 : \(calculateTotalCost())")
        print("------------------------------------------")
    }
    
    func calculateTotalCost() -> Int {
        var totalCost = 0
        for (_, item) in cartItems.enumerated() {
            totalCost += item.menuCost
        }
        return totalCost
    }
    
    func clearCart() {
        cartItems.removeAll()
        cartItemDictionary.removeAll()
    }
}
