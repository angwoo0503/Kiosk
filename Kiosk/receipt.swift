//
//  receipt.swift
//  Kiosk
//
//  Created by DJ S on 2023/07/24.
//

import Foundation

class Receipt {
    //    var shoppingBasket: [Menu] = []
    // Menu객체 담는 저장소 '장바구니'
    
    //    func addList(item: Menu) {
    //        shoppingBasket.append(item)
    //    }
    // Menu객체 내에서 담길 목록을 shoppingBasket에 추가하는 메서드
    
    func receiptPrint(cartItems: [CartItem], totalCost: Int) {
        
        print("KFC 스파르타점")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        print("구매일시: \(formatter.string(from: Date()))\n")
        // 현재시간
        
        // 총 가격을 천 단위로 변환하여 출력
        let costStyle = NumberFormatter()
        costStyle.numberStyle = .decimal
        
        for (index, item) in cartItems.enumerated() {  // 각 메뉴와 그 메뉴의 번호, 수량, 가격을 출력
            let formattedCost = costStyle.string(from: NSNumber(value: item.menuCost)) ?? ""
            print("\(index + 1). \(item.menuName) - 수량 : \(item.quantity) 가격 : \(formattedCost)원")
        }
        //        for item in shoppingBasket {
        //            print("\(item.menu_Name): \(item.menu_Cost)원")
        //            amount += item.menu_Cost
        //        }
        // 반복문 사용하여 장바구니에 객체담기 및 총액구하기
        
        // 총 가격을 천 단위로 변환하여 출력
        let formattedTotalCost = costStyle.string(from: NSNumber(value: totalCost)) ?? ""
        print("\n총 가격: \(formattedTotalCost)원")
        let formattedMyMoney = costStyle.string(from: NSNumber(value: orderManager.myMoney)) ?? ""
        print("구매 후 잔액: \(formattedMyMoney)원\n")
        print("KFC 스파르타점을 이용해주셔서 감사합니다.\n")
        print("화장실은 2층에 있습니다.")
        print("남: *1029#   여:*3847#\n")
        print("------------------------------------------")
    }
}
