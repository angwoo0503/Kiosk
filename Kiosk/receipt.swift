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
    
    func receiptPrint(cartItems: [String: Int]) {
        
        print("KFC 스파르타점")
        
        let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        print("구매일시: \(formatter.string(from: Date()))")
        // 현재시간
        
        print("------------------------------------------")
        
        var amount = 0
        // 판매액 저장
        
        for (menuName, cost) in cartItems {
                    print("\(menuName): \(cost)원")
                    amount += cost
                }
//        for item in shoppingBasket {
//            print("\(item.menu_Name): \(item.menu_Cost)원")
//            amount += item.menu_Cost
//        }
        // 반복문 사용하여 장바구니에 객체담기 및 총액구하기
        
        print("------------------------------------------")
        print("판매액: \(amount)원")
        print("------------------------------------------")
    }
}
