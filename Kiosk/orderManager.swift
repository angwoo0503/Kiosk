import Foundation


class OrderManager : ReadIntFromConsole {
    var cartItems : [String : Int] = [:]
    var myMoney : Int
    var orderStatus : OrderStatus
    var totalMoney : Int
    
    let menuCategories = ["버거","치킨","사이드","음료"] // 임시로 구현
    var menuItems: [[String]] = [] // 각 카테고리에 해당하는 메뉴들을 2차원 배열로 저장
    
    
    
    init(myMoney: Int) {
        self.myMoney = myMoney
        self.orderStatus = .empty
        self.totalMoney = 0
        // 각 카테고리에 해당하는 메뉴들을 초기화하는 로직 구현
        menuItems = [
                    ["버거 메뉴1", "버거 메뉴2", "버거 메뉴3"],
                    ["치킨 메뉴1", "치킨 메뉴2"],
                    ["사이드 메뉴1", "사이드 메뉴2", "사이드 메뉴3", "사이드 메뉴4"],
                    ["음료 메뉴1", "음료 메뉴2", "음료 메뉴3"]
                ]
    }
    
    // 메인 페이지
    // 1. 메뉴 카테고리 선택
    // 2. 종료
    func mainPage() {
        
        MenuPrint().printMenuBoard(category: <#T##String#>, menu_Board: <#T##[String : Menu]#>)
        
        if orderStatus == .empty {
            // 장바구니가 비어있는 경우
            if let choice = readIntFromConsole() {
                switch choice {
                    switch choice {
                    case 1...menuCategories.count:
                        // 선택한 카테고리 상세 메뉴 페이지로 이동
                        detailMenuPage(categoryIndex: choice-1)
                    }
                case 0: fatalError("프로그램을 종료합니다.") // 프로그램 종료
                default: print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
                    mainPage()//
                }
            }
        } else {
            // 장바구니에 상품이 있는 경우
            if let choice = readIntFromConsole() {
                switch choice {
                case 1...menuCategories.count:
                    // 선택한 카테고리로 상세 메뉴 페이지로 이동
                    detailMenuPage(categoryIndex: choice-1)
                case menuCategories.count+1:
                    orderPage() // 장바구니를 확인 후 주문
                case menuCategories.count+2:
                    cancelOrder() // 진행중인 주문을 취소
                case 0: fatalError("프로그램을 종료합니다.") // 프로그램 종료
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
        let category = menuCategories[categoryIndex]
        print("\(category) 메뉴 목록:")
        
        let menus = menuItems[categoryIndex]
        for (index, menu) in menus.enumerated() {
            print("\(index+1). \(menu)")
        }
        print("0. 뒤로 가기")
        
        if let choice = readIntFromConsole() {
            switch choice {
            case 1...menus.count: // 메뉴 선택
                // 선택한 메뉴로 장바구니 추가 등 필요한 로직 수행
                print("\(category) 메뉴 \(choice)를 선택했습니다.")
                mainPage()            case 0: mainPage() // 메인 페이지로 이동 (뒤로 가기)
            default: print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
                detailMenuPage()
            }
        }
    }
    
    
    // 장바구니 추가 페이지
    // 1. 확인
    // 2. 취소
    func orderCheckPage() {
        if let choice = readIntFromConsole() {
            switch choice {
            case 1: fallthrough // 1. 확인 .inProgress 들어가야 함
            case 2: mainPage() // 2. 취소
            default: print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
                orderCheckPage()
            }
        }
    }
    
    
    // 장바구니 확인 및 주문 페이지
    // 1. 주문
    // 2. 메뉴판
    func orderPage() {
        if let choice = readIntFromConsole() {
            switch choice {
            case 1: if canOrderTime() {
                if canOrderMoney() {
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
    
    // 금액 지불 조건
    func canOrderMoney() -> Bool {
        if myMoney >= totalMoney {
            return true
            } else {
                return false
            }
    }
    
    // 주문을 진행하는 함수
    func successOrder() {
        // 영수증 클래스(print)가 올 자리
        myMoney -= totalMoney
        orderStatus = .completed
        mainPage()
    }
    
    
    // 진행중인 주문 취소
    func cancelOrder() {
        print("진행중인 주문을 취소했습니다.")
        cartItems.removeAll()
        orderStatus = .empty
        mainPage()
    }
    
    // 현재 결제 가능 시간인가?
    func canOrderTime() -> Bool {
        // 결제 가능 시간
        let currentTime = Date()
        let calendar = Calendar.current

        guard let startTime = calendar.date(bySettingHour: 11, minute: 10, second: 0, of: currentTime) else {fatalError("결제 가능 시간을 불러오는 과정에서 오류가 났습니다.")}
        guard let endTime = calendar.date(bySettingHour: 11, minute: 20, second: 0, of: currentTime) else {fatalError("결제 가능 시간을 불러오는 과정에서 오류가 났습니다.")}

        return currentTime >= startTime && currentTime <= endTime
    }
}
