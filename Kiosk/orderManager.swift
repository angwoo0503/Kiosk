import Foundation


class OrderManager : ReadIntFromConsole {
    
    var myMoney : Int
    var orderStatus : OrderStatus
    var totalMoney : Int
    var cart : Cart
    
    init(myMoney: Int) {
        self.myMoney = myMoney
        self.orderStatus = .empty
        self.totalMoney = 0
        self.cart = Cart(menuName: "", quantity: 0, menuCost: 0)
    }
    
    // 메인 페이지
    // 1. 메뉴 카테고리 선택
    // 2. 종료
    func mainPage() {
        print("1. 버거 2. 치킨 3. 사이드 4. 음료 0. 종료")
        if orderStatus == .empty {
            // 장바구니가 비어있는 경우
            if let choice = readIntFromConsole() {
                switch choice {
                case 1...Categories.allCases.count:
                    // 선택한 카테고리 상세 메뉴 페이지로 이동
                    detailMenuPage(categoryIndex: choice)
                case 0: print("프로그램을 종료합니다.")
                    exit(0) // 프로그램 종료
                default: print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
                }
            }
        } else {
            // 장바구니에 상품이 있는 경우 (주문이 진행중인 경우)
            if let choice = readIntFromConsole() {
                switch choice {
                case 1...Categories.allCases.count:
                    // 선택한 카테고리로 상세 메뉴 페이지로 이동
                    detailMenuPage(categoryIndex: choice)
                case Categories.allCases.count+1:
                    orderPage() // 장바구니를 확인 후 주문
                case Categories.allCases.count+2:
                    cancelOrder() // 진행중인 주문을 취소
                case 0: print("프로그램을 종료합니다.")
                    exit(0) // 프로그램 종료
                default: print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
                    mainPage()
                }
            }
        }
    }

    // 상세 메뉴 페이지
    // 1. 메뉴 선택
    // 2. 뒤로 가기
    func detailMenuPage(categoryIndex: Int) {
        // categoryIndex에 해당하는 카테고리 메뉴들 출력
        let category = Categories.allCases[categoryIndex - 1]
        guard let menus = menus[category] else { // 열거형의 원시값을 이용해 메뉴 변수 할당
            fatalError("상세 메뉴를 불러오는 과정에서 오류가 났습니다.")
        }
        let menuPrint = MenuPrint()
        menuPrint.printMenuBoard(category: category.rawValue, menu_Board: menus)
        print("0. 뒤로 가기")
        if let choice = readIntFromConsole() {
            switch choice {
            case 1...menus.count: // 메뉴 선택
                // 선택한 메뉴로 장바구니 추가 등 필요한 로직 수행 코드 작성 필요!!!!
                guard let menuName = menus[choice]?.menu_Name else { return }
                guard let menuCost = menus[choice]?.menu_Cost else { return }
                guard let menuInfo = menus[choice]?.menu_Info else { return }
                print("\(menuName) | \(menuCost) | \(menuInfo)")
                orderCheckPage(menuName: menuName, menuCost: menuCost)
            case 0: mainPage() // 메인 페이지로 이동 (뒤로 가기)
            default: print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
            }
        }
    }
    
    
    // 장바구니 추가 페이지
    // 1. 확인
    // 2. 취소
    func orderCheckPage(menuName : String, menuCost : Int) {
        print("위 메뉴를 장바구니에 추가하시겠습니까?\n1. 확인\n2. 취소")
        if let choice = readIntFromConsole() {
            switch choice {
            case 1: // 1. 확인 장바구니 클래스, .inProgress 들어가야 함
                    cart.addItemToCart(menuName: menuName, quantity: 1, menuCost: menuCost)
                cart.printcartItems()
                mainPage()
            case 2: mainPage() // 2. 취소
            default: print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
            }
        }
    }
    
    
    // 장바구니 확인 및 주문 페이지
    // 1. 주문
    // 2. 메뉴판
    func orderPage() {
        if let choice = readIntFromConsole() {
            switch choice {
            case 1: if bankCheck() {
                if moneyCheck(myMoney: myMoney, totalMoney: totalMoney) {
                    successOrder() // 주문 성공
                } else {
                    print("현재 잔액은 5.5W으로 1.4W이 부족해서 주문할 수 없습니다.")
                }
            } else {
                print("현재 시각은 오후 11시 10분입니다. 은행 점검 시간은 오후 11시 10분 ~ 오후 11시 20분이므로 결제할 수 없습니다.")
            }// 조건(금액, 시간) 확인후 주문
            case 2: mainPage() // 메뉴판 이동
            default:
                print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
                orderPage()
            }
        }
    }
    
    
    // 주문을 진행하는 함수
    func successOrder() {
        // 영수증 클래스(print)가 올 자리
//        var receipt = Receipt()
//        receipt.receiptPrint()
        myMoney -= totalMoney
        orderStatus = .completed
        mainPage()
    }
    
    
    // 진행중인 주문 취소
    func cancelOrder() {
        print("진행중인 주문을 취소했습니다.")
        cart.clearCart()
        orderStatus = .empty
        mainPage()
    }
    
    
    // 영덕님이 구현한 기능
    //    // 현재 결제 가능 시간인가?
    //    func canOrderTime() -> Bool {
    //        // 결제 가능 시간
    //        let currentTime = Date()
    //        let calendar = Calendar.current
    //
    //        guard let startTime = calendar.date(bySettingHour: 11, minute: 10, second: 0, of: currentTime) else {fatalError("결제 가능 시간을 불러오는 과정에서 오류가 났습니다.")}
    //        guard let endTime = calendar.date(bySettingHour: 11, minute: 20, second: 0, of: currentTime) else {fatalError("결제 가능 시간을 불러오는 과정에서 오류가 났습니다.")}
    //
    //        return currentTime >= startTime && currentTime <= endTime
    //    }
    //
}
