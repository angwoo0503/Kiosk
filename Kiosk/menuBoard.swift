//
//  class.swift
//  Kiosk
//
//  Created by 서영덕 on 2023/07/24.
//

import Foundation


class Menu {
    var menu_name : String
    var menu_cost : Int
    var menu_info : String
    
    init(menu_name: String, menu_cost: Int, menu_info: String) {
        self.menu_name = menu_name
        self.menu_cost = menu_cost
        self.menu_info = menu_info
    }
}

var menu_board = [
    "001" : Menu(menu_name: "타워버거", menu_cost: 6_300, menu_info: "두툼한 통가슴살 필렛과 해시브라운, 슬라이스 치즈까지 KFC 시그니처 버거") ,
    "002" : Menu(menu_name: "징거버거", menu_cost: 5_500, menu_info: "더 커진 닭가슴살필렛과 상큼한 토마토가 어우러진 대표 치킨버거") ,
    "003" : Menu(menu_name: "캡새버거", menu_cost: 4_300, menu_info: "탱글탱글한 새우살이 콕콕 그 새우버거가 KFC에서 더 맛있게 나왔새우"),
    "004" : Menu(menu_name: "핫크리스피치킨", menu_cost: 3_000, menu_info: "KFC만의 비법으로 매콤 바삭하게 튀겨낸 KFC 핫크리스피치킨"),
    "005" : Menu(menu_name: "갓양념치킨", menu_cost: 3_300, menu_info: "달콤 매콤, 먹을수록 땡기는 맵달의 조화 한국인 입맛에 딱 맞춘 환상의 양념치킨"),
    "006" : Menu(menu_name: "뉴갓쏘이치킨", menu_cost: 3_300, menu_info: "육즙 가득 바삭한 치킨과 KFC 비법 간장소스가 만났다!"),
    "007" : Menu(menu_name: "케이준후라이", menu_cost: 2_800, menu_info: "케이준 양념으로 더욱 고소하고 바삭해진 KFC 케이준후라이"),
    "008" : Menu(menu_name: "코울슬로", menu_cost: 2_000, menu_info: "양배추와 당근, 각종 신선한 야채를 상큼하게 버무린 샐러드"),
    "009" : Menu(menu_name: "코카콜라", menu_cost: 2_000, menu_info: "속까지 시원해지는 청량음료의 대표! 콜라"),
    "010" : Menu(menu_name: "스프라이트", menu_cost: 2_000, menu_info: "속까지 시원해지는 청량음료 스프라이트!")
]



class MenuPrint {
    func printMenuBoard(menu_board: [String: Menu]) {
        print("-------------------")
        print("\n메뉴판\n")
        let menuBoardKeys = menu_board.keys.sorted()
        for key in menuBoardKeys {
            if let value = menu_board[key] {
                print("제품번호: \(key)")
                print("상품명: \(value.menu_name)")
                print("가격: \(value.menu_cost)")
                print("상품정보: \(value.menu_info)\n")
            }
        }
        print("-------------------")
    }
}


/* 실행 하시려면 이렇게 실행하시면 됩니다!
 
 let menuPrint = MenuPrint()
 menuPrint.printMenuBoard(menu_board: menu_board)
 
 */





