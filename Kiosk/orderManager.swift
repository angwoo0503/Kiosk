import Foundation



class OrderManager : ReadIntFromConsole, InvaildInputPrint {
    
    var myMoney : Int // 사용자의 보유 금액 변수
    var orderStatus : OrderStatus // 주문 상태 변수
    var cart : Cart // 장바구니 객체 변수
    
    init(myMoney: Int) {
        self.myMoney = myMoney
        self.orderStatus = .empty
        self.cart = Cart()
    }
    
    // 메인 페이지 표시 메서드
    // 주문 상태에 따라 표시하는 메뉴 항목이 다름
    func mainPage() {
        if orderStatus == .empty || orderStatus == .completed {
            // 장바구니가 비어있는 경우
            let autoMaticOutput = AutoMaticOutput(roopTime: 100)
            autoMaticOutput.start()
            print("1. 버거\n2. 치킨\n3. 사이드\n4. 음료\n0. 종료")
            if let choice = readIntFromConsole() {
                switch choice {
                case 1...Categories.allCases.count:
                    // 선택한 카테고리 상세 메뉴 페이지로 이동
                    sleep(1)
                    detailMenuPage(categoryIndex: choice)
                case 0: print("프로그램을 종료합니다.")
                    sleep(1)
                    exit(0) // 프로그램 종료
                default: printErrorMessage()
                    sleep(1)
                    mainPage()
                }
            }
        } else {
            // 장바구니에 상품이 있는 경우 (주문이 진행중인 경우)
            print("1. 버거\n2. 치킨\n3. 사이드\n4. 음료\n5. 주문\n6. 장바구니\n0. 종료")
            if let choice = readIntFromConsole() {
                switch choice {
                case 1...Categories.allCases.count:
                    // 선택한 카테고리로 상세 메뉴 페이지로 이동
                    sleep(1)
                    detailMenuPage(categoryIndex: choice)
                case Categories.allCases.count+1:
                    sleep(1)
                    orderPage() // 장바구니를 확인 후 주문
                case Categories.allCases.count+2:
                    sleep(1)
                    cartPage() // 장바구니 페이지로 이동
                case 0: print("프로그램을 종료합니다.")
                    sleep(1)
                    exit(0) // 프로그램 종료
                default: printErrorMessage()
                    sleep(1)
                    mainPage()
                }
            }
        }
    }
    
    // 카테고리에 따른 상세 메뉴 페이지 표시 함수
    func detailMenuPage(categoryIndex: Int) {
        // categoryIndex에 해당하는 카테고리 메뉴들 출력
        let category = Categories.allCases[categoryIndex - 1]
        guard let menus = menus[category] else { // 열거형의 원시값을 이용해 메뉴 변수 할당
            fatalError("상세 메뉴를 불러오는 과정에서 오류가 났습니다.")
        }
        let menuPrint = MenuPrint()
        menuPrint.printMenuBoard(category: category.rawValue, menu_Board: menus)
        print("0. 뒤로 가기")
        print("------------------------------------------")
        if let choice = readIntFromConsole() {
            switch choice {
            case 1...menus.count: // 메뉴 선택
                guard let menuName = menus[choice]?.menu_Name else { return }
                guard let menuCost = menus[choice]?.menu_Cost else { return }
                guard let menuInfo = menus[choice]?.menu_Info else { return }
                print("------------------------------------------\n")
                print("\(menuName) | \(menuCost) | \(menuInfo)")
                orderCheckPage(menuName: menuName, menuCost: menuCost)
            case 0: sleep(1)
                mainPage() // 메인 페이지로 이동 (뒤로 가기)
            default: printErrorMessage()
                sleep(1)
                detailMenuPage(categoryIndex: categoryIndex)
            }
        }
    }
    
    
    // 선택한 메뉴를 장바구니에 추가할지 선택하는 페이지 표시 메서드
    func orderCheckPage(menuName : String, menuCost : Int) {
        print()
        print("위 메뉴를 장바구니에 추가하시겠습니까?\n1. 확인\n2. 취소\n")
        print("------------------------------------------")
        if let choice = readIntFromConsole() {
            switch choice {
            case 1: // 1. 확인 장바구니에 추가
                cart.addItemToCart(menuName: menuName, quantity: 1, unitCost: menuCost, orderStatus: .inProgress)
                orderStatus = cart.orderStatus // 현재 cart의 orderStatus를 할당 (.inProgress)
                sleep(1)
                cart.printCartItems()
                
                // cartMessage
                let cartMessage = CartMessage()
                cartMessage.showAddToCartMessage()
                sleep(3)
                mainPage()
            case 2: sleep(1) // 2. 취소 메인 페이지로 돌아감
                mainPage()
            default: printErrorMessage() // 에러 메세지 출력 후 페이지 새로 불러오기
                sleep(1)
                orderCheckPage(menuName: menuName, menuCost: menuCost)
            }
        }
    }
    
    
    // 장바구니 페이지 표시 메서드
    func cartPage() {
        // 장바구니 아이템 출력
        cart.printCartItems()
        print("제외하려는 메뉴 번호를 입력하세요.")
        print("0. 뒤로 가기")
        print("------------------------------------------")
        if let choice = readIntFromConsole() {
            // 입력한 번호가 장바구니에 있는 아이템 수량 내에 있는지 확인
            if choice >= 1 && choice <= cart.cartItems.count {
                // 장바구니에 있는 아이템의 수가 1개일 때
                if cart.cartItems[choice - 1].quantity == 1 {
                    cart.removeItemByNumber(number: choice, quantity: 1)
                    print("------------------------------------------")
                    print("메뉴가 제외 되었습니다.")
                } else {
                    print("------------------------------------------")
                    print("제외할 메뉴의 수량을 입력하세요.")
                    print("------------------------------------------")
                    if let quantity = readIntFromConsole() {
                        if cart.cartItems[choice - 1].quantity >= quantity {
                            cart.removeItemByNumber(number: choice, quantity: quantity)
                            print("------------------------------------------")
                            print("아이템이 제거되었습니다.")
                        } else {
                            print("제외할 메뉴의 수량이 현재 메뉴의 수량보다 많습니다.")
                            sleep(1)
                            cartPage()
                        }
                    } else {
                        // 유효하지 않은 수량 입력시 에러 메시지 출력 후 재시도
                        printErrorMessage()
                        sleep(1)
                        cartPage()
                    }
                }
                sleep(1)
                // 장바구니가 비었다면 주문 상태를 empty로 변경
                if cart.cartItems.isEmpty {
                    orderStatus = .empty
                }
                cartPage()
            } else if choice == 0 {
                // 메인 페이지로 돌아감
                sleep(1)
                mainPage()
            } else {
                // 유효하지 않은 번호 입력시 에러 메시지 출력 후 재시도
                printErrorMessage()
                sleep(1)
                cartPage()
            }
        }
    }

    
    // 주문 페이지 표시 메서드
    func orderPage() {
        cart.printCartItems()
        print("주문하시겠습니까?\n1.확인\n2.취소")
        print("------------------------------------------")
        if let choice = readIntFromConsole() {
            switch choice {
            case 1: if bankCheck() {
                if moneyCheck(myMoney: myMoney, totalMoney: cart.calculateTotalCost()) {
                    sleep(1)
                    successOrder() // 주문 성공
                } else {
                    print("현재 잔액은 \(myMoney)원으로 \(cart.calculateTotalCost() - myMoney)원이 부족해서 주문할 수 없습니다.")
                    sleep(1)
                    mainPage()
                }
            } else {
                print("현재 시각은 오후 11시 10분입니다. 은행 점검 시간은 오후 11시 10분 ~ 오후 11시 20분이므로 결제할 수 없습니다.")
                sleep(1)
                mainPage()
            }// 조건(금액, 시간) 확인후 주문
            case 2: sleep(1)
                mainPage() // 메뉴판 이동
            default:
                printErrorMessage()
                sleep(1)
                orderPage()
            }
        }
    }
    
    
    // 주문을 완료하는 메서드
    func successOrder() {
        myMoney -= cart.calculateTotalCost()
        orderStatus = .completed
        // cartMessage
        print("------------------------------------------")
        print("결제가 완료되었습니다.")
        let receipt = Receipt()
        receipt.receiptPrint(cartItems: cart.cartItems, totalCost: cart.calculateTotalCost())
        cart.clearCart()
        sleep(3)
        mainPage()
    }
    
    
    // 진행중인 주문 취소 메서드
    func cancelOrder() {
        print("진행중인 주문을 취소했습니다.")
        cart.clearCart()
        orderStatus = .empty
        sleep(1)
        mainPage()
    }
}
