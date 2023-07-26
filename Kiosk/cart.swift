
class Cart {
    var menuName : String
    var cartItems : [String : (quantity : Int,  menuCost : Int)] = [:]
    var orderStatus : OrderStatus
    
    init(menuName: String, quantity: Int, menuCost: Int) {
        self.menuName = menuName
        self.orderStatus = .empty
    }
    
    func addItemToCart(menuName: String, quantity: Int, menuCost: Int, orderStatus: OrderStatus) {
        self.orderStatus = .inProgress
        if let existingItem = cartItems[menuName] {
            // 이미 물건이 있는 경우, 수량과 가격을 업데이트
            let updatedQuantity = existingItem.quantity + quantity
            let updatedCost = existingItem.menuCost + menuCost
            cartItems[menuName] = (quantity: updatedQuantity, menuCost: updatedCost)
        } else {
            // 물건이 없는 경우, 새로운 키-값 쌍을 추가
            cartItems[menuName] = (quantity: quantity, menuCost: menuCost)
        }
    }
    
    func printCartItems () {
        print("------------------------------------------\n")
        for (menuName, (quantity, menuCost)) in cartItems {
            print("\(menuName) - 수량 : \(quantity) 가격 : \(menuCost * quantity)\n")
        }
        print("총 가격 : \(calculateTotalCost())\n")
        print("------------------------------------------")
    }
    
    func calculateTotalCost() -> Int {
            var totalCost = 0
            for (_, (quantity, menuCost)) in cartItems {
                totalCost += quantity * menuCost
            }
            return totalCost
        }
    
    func removeItem(menu: Menu) {
            cartItems.removeValue(forKey: menu.menu_Name)
        }
        
    func clearCart() {
            cartItems.removeAll()
    }
}