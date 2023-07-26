// 장바구니에 들어갈 아이템을 정의하는 구조체
struct CartItem {
    var menuName : String  // 메뉴 이름
    var quantity : Int  // 수량
    var menuCost : Int  // 메뉴 가격 (수량에 따른 총 가격)
    var unitCost: Int  // 단위 가격
}

// 장바구니를 관리하는 클래스
class Cart {
    var cartItems: [CartItem] = []  // 장바구니에 담긴 아이템들
    var cartItemDictionary: [String: Int] = [:]  // 메뉴 이름을 키로, cartItems 배열의 인덱스를 값으로 가지는 딕셔너리
    var orderStatus: OrderStatus  // 주문 상태
    
    // 초기화 메서드
    init() {
        self.orderStatus = .empty  // 초기 주문 상태는 empty
    }
    
    // 장바구니에 아이템을 추가하는 메서드
    func addItemToCart(menuName: String, quantity: Int, unitCost: Int, orderStatus: OrderStatus) {
        self.orderStatus = .inProgress  // 주문 상태를 진행 중으로 변경
        // 만약 같은 이름의 메뉴가 이미 장바구니에 있다면
        if let index = cartItemDictionary[menuName] {
            let updatedQuantity = cartItems[index].quantity + quantity  // 수량 업데이트
            let updatedCost = cartItems[index].menuCost + unitCost * quantity  // 총 가격 업데이트
            // 장바구니에 있는 해당 메뉴 아이템 업데이트
            cartItems[index] = CartItem(menuName: menuName, quantity: updatedQuantity, menuCost: updatedCost, unitCost: unitCost)
        } else {  // 장바구니에 해당 메뉴가 없다면 새로운 아이템 추가
            let newItem = CartItem(menuName: menuName, quantity: quantity, menuCost: unitCost * quantity, unitCost: unitCost)
            cartItems.append(newItem)
            cartItemDictionary[menuName] = cartItems.count - 1  // 딕셔너리에도 추가
        }
    }
    
    // 장바구니에서 아이템을 제거하는 메서드
    func removeItemByNumber(number: Int, quantity: Int) {
        if number >= 1 && number <= cartItems.count {  // 유효한 번호인 경우
            cartItems[number - 1].quantity -= quantity  // 수량 감소
            cartItems[number - 1].menuCost -= cartItems[number - 1].unitCost * quantity  // 총 가격 감소
            // 수량이 0 이하가 되면 장바구니에서 아이템 제거
            if cartItems[number - 1].quantity <= 0 {
                let removedItem = cartItems.remove(at: number - 1)
                cartItemDictionary.removeValue(forKey: removedItem.menuName)  // 딕셔너리에서도 제거
                // 딕셔너리 인덱스 업데이트
                for i in number - 1..<cartItems.count {
                    cartItemDictionary[cartItems[i].menuName] = i
                }
            }
        } else {  // 유효하지 않은 번호일 경우 에러 메시지 출력
            print("잘못된 번호입니다.")
        }
    }
    
    // 장바구니에 있는 아이템들을 출력하는 메서드
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
    
    // 장바구니에 있는 모든 아이템들의 가격을 합하여 반환하는 메서드
    func calculateTotalCost() -> Int {
        var totalCost = 0
        for (_, item) in cartItems.enumerated() {
            totalCost += item.menuCost
        }
        return totalCost
    }
    
    // 장바구니를 모두 비우는 메서드
    func clearCart() {
        cartItems.removeAll()
        cartItemDictionary.removeAll()
    }
}
